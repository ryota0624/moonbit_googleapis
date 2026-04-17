# Steering: Firestore e2e テスト向けコードジェネレーター修正

## 目的・背景

`moon test e2e/firestore --target native` で Firestore エミュレーターに対する e2e テストを通したいが、以下 3 点が失敗要因となっていた:

1. `PATCH` リクエストが POST + `x-http-method-override` として送信されており、Firestore エミュレーターが拒否する
2. サーバーストリーミング RPC (`RunQuery`) のレスポンスが単一 JSON としてパースされ、ストリーム形式では扱えない
3. `{parent}:runQuery` のように `:verb` サフィックスを持つパステンプレートが `.../documents/:runQuery`（余計な `/` 付き）で組み立てられ、エミュレーターが 400 を返す

これらはすべて生成コードに現れているが、根本原因は HTTP クライアント実装 (`http/default.mbt`) とコードジェネレーター (`discovery/codegen.mbt`) にある。

## ゴール

- `moon test e2e/firestore --target native` が全 6 シナリオ通る
- 生成コードは触らず、ジェネレーターと共通 HTTP 層を修正
- 今後他の googleapis 対象パッケージを再生成しても同じ問題が再発しないこと

## アプローチ

### 1. PATCH の実装 (`http/default.mbt`)

`@xhttp` の低レベル API (`Client::request` + `Writer::write` + `flush` + `end_request`) を使って真の `PATCH` メソッドを送信する `client_request_with_body` を実装し、DELETE もこれに寄せてレスポンスボディを正しく読み取れるようにする。

### 2. サーバーストリーミングのデコード (`discovery/codegen.mbt`)

Google API の REST マッピングでは server-streaming レスポンスは単一の JSON 配列 (`[resp1, resp2, ...]`) として返る。`rest_m.server_streaming` が true のとき、`@json.parse` 後に `Array(xs)` パターンで分解して各要素を個別にデコードするコードを生成する。

### 3. `:verb` サフィックス付きパス (`discovery/codegen.mbt`)

`path_expr_from_template` のオペランド表現を `(expr, needs_slash)` タプルに変更し、`:verb` で始まるリテラル断片は `needs_slash = false` で積むようにする。結果として `"/" + "v1" + "/" + parent + ":runQuery"` のように `:verb` の前だけ `/` を省略できる。

## スコープ

含む:
- `http/default.mbt` の PATCH/DELETE 実装差し替え
- `discovery/codegen.mbt` のストリーミング／パステンプレート生成修正
- Firestore クライアントの再生成
- `CLAUDE.md` に「生成コードを直接修正せずジェネレーターを直す」原則を追記

含まない:
- `pubsub` / `cloudtasks` / `cloudscheduler` などの再生成（別タスク）
- 新規 e2e シナリオの追加
- ジェネレーターのパイプライン / workflow スクリプトの再構成

## 影響範囲

- `http/default.mbt` — PATCH/DELETE 経路が `@xhttp.Client` 低レベル API に切り替わるため、これらのメソッドを使う全クライアントに影響
- `discovery/codegen.mbt` — 以後の再生成出力全体に影響
- `generated/firestore/*` — 再生成結果
- `CLAUDE.md` — 作業方針の追記
