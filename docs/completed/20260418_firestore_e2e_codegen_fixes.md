# 完了報告: Firestore e2e テスト向けコードジェネレーター修正

## 実装内容

3 つの異なる層にまたがる修正によって `moon test e2e/firestore --target native` を通るようにした。

### 1. HTTP PATCH/DELETE 実装の書き直し (`http/default.mbt`)

- 旧実装: `PATCH` は POST + `x-http-method-override: PATCH` ヘッダー、`DELETE` はレスポンスボディを読まずに捨てていた
- 新実装: `@xhttp.Client` の低レベル API (`Client::new` → `request` → `Writer::write` → `flush` → `end_request` → `Reader::read_all`) を使う共通ヘルパー `client_request_with_body` を追加し、PATCH/DELETE の両方で使用

```moonbit
async fn client_request_with_body(
  req : HttpRequest,
  meth : HttpMethod,
) -> HttpResponse raise HttpError {
  let host = extract_host_url(req.url)
  let path = extract_path_from_url(req.url)
  let client = @xhttp.Client::new(host, headers=req.headers) catch {
    e => raise HttpError::NetworkError(e.to_string())
  }
  client.request(to_xhttp_method(meth), path, extra_headers={}) catch {
    e => { client.close(); raise HttpError::NetworkError(e.to_string()) }
  }
  // ... 以下 payload の write、flush、end_request、read_all
}
```

### 2. サーバーストリーミングレスポンスのデコード (`discovery/codegen.mbt`)

- Google API の REST マッピングでは server-streaming RPC のレスポンスは単一の JSON 配列
- `rest_m.server_streaming` が true の場合、`@json.parse` → `match json { Array(xs) => xs ... }` → 各要素を `@json.from_json` で `Array[ResponseType]` にデコードするコードを生成するよう変更

### 3. `:verb` サフィックス付きパステンプレート (`discovery/codegen.mbt`)

- `path_expr_from_template` のオペランドを `Array[String]` → `Array[(String, Bool)]` に変更（第 2 要素は「前に `/` を付けるか」）
- リテラル断片が `:` で始まる場合 (`:runQuery` 等) は `needs_slash = false` で積む
- 出力が `"/" + "v1" + "/" + parent + ":runQuery"` のようになり、`:verb` の直前だけ `/` が省略される

## 技術的な決定事項

### PATCH/DELETE での `@xhttp.Client` 低レベル利用
- `@xhttp.patch` / `@xhttp.delete` のような高レベル関数は提供されていないため、`Client::new` + `Writer::write` + `flush` + `end_request` + `Reader::read_all` の一連のシーケンスを書く必要がある
- `@io.Writer::write` と `@io.Reader::read_all` は型付きエラーを返さない `raise Error` 関数なので、`catch { e => client.close(); raise HttpError::NetworkError(e.to_string()) }` で明示的に `HttpError` に変換する

### ストリーミングは「NDJSON でなく JSON 配列」
- 当初 NDJSON（改行区切り JSON）としてパースする実装を入れたが、実際のエミュレーターレスポンスは `[\n{ ... },\n{ ... }\n]` という 1 本の JSON 配列だった
- Google Cloud REST API の HTTP transcoding 仕様に合わせて JSON 配列としてパースするのが正解

### パステンプレートのオペランド構造変更
- `append_lit_path_operands` の呼び出し側が 1 箇所しかないため、シグネチャ変更のコストは低い
- 複雑な式組み立てロジックをコード文字列結合でなく `StringBuilder` に寄せて、生成コードのブランチを明確化

### 生成コードを直接直さない原則
- `CLAUDE.md` に「`generated/` 配下のファイルはコードジェネレーター出力であり直接修正してはいけない」「バグを見つけたら `discovery/codegen.mbt` を直して再生成する」原則を追記

## 変更ファイル一覧

**修正:**
- `http/default.mbt` — PATCH/DELETE 実装を `@xhttp.Client` ベースに刷新、`x-http-method-override` ヘッダー対応を削除
- `discovery/codegen.mbt` — `append_lit_path_operands` / `path_expr_from_template` を `:verb` 対応に、server-streaming レスポンスを JSON 配列パースに
- `generated/firestore/client.mbt`, `generated/firestore/types.mbt`, `generated/firestore/helpers.mbt`, `generated/firestore/moon.pkg` — 再生成
- `e2e/firestore/e2e_test.mbt` — `moon fmt` 適用のみ（挙動差分なし）
- `CLAUDE.md` — 「生成コードを直接修正しない」原則を追記

**追加:**
- `docs/steering/20260418_firestore_e2e_codegen_fixes.md`
- `docs/completed/20260418_firestore_e2e_codegen_fixes.md`

## テスト

- `moon check --target native` — エラー 0、警告 1（`e2e/firestore/moon.pkg` の `supported_targets` 未宣言警告。既存）
- `moon test e2e/firestore --target native` — 1/1 passed（6 シナリオ全通過）
  - `create_document` + `get_document`
  - `list_documents`
  - `update_document`（PATCH 経路）
  - `delete_document`（DELETE でレスポンスボディ読取）
  - `run_query`（server-streaming、`:runQuery` サフィックス）
  - `commit` (batch write)

## 動作確認方法

```bash
moon test e2e/firestore --target native
```

`google/cloud-sdk:emulators` イメージを使ったテストコンテナで Firestore エミュレーターを立ち上げ、Docker / Colima などが動作している必要がある。

## 今後の課題・改善点

- [ ] `pubsub` / `cloudtasks` / `cloudscheduler` の再生成（これらも `:verb` サフィックス付きパスを使っているためジェネレーター修正の恩恵を受けられる）
  - 現状は個別の proto image ファイル (`/tmp/<api>-image.json`) が必要で、統合 image (`/tmp/googleapis-image.json`) は非 UTF-8 バイトを含むため codegen が落ちる。各 API 用の image を `buf build --path` で切り出してから再生成する運用にする
- [ ] `@xhttp` の高レベル PATCH/DELETE ヘルパーが追加されたら `client_request_with_body` を差し替え
- [ ] `run_query` などのストリーミングメソッドでプッシュ型 (`Iterator`) を返す API を検討（現状は全件を `Array` で返している）

## 参考資料

- [AIP-136 Custom methods](https://google.aip.dev/136) — `:verb` パステンプレートの規約
- [Google API HTTP transcoding](https://cloud.google.com/endpoints/docs/grpc/transcoding) — server-streaming → JSON 配列のマッピング
- 前回セッション: `docs/completed/20260417_firestore_e2e.md`
