# Steering: Discovery不要化 — protobufのみからのコード生成

## 目的・背景

現在のcodegenは `discovery/` パッケージが Google Discovery JSON をベース情報として読み込み、protobuf（buf Image JSON）からserver-streamingフラグのみを補完している。Discovery JSONは手動で取得が必要で、Google側の更新に乗り遅れるリスクがある。一方、googleapis submodule（buf Image）はすでにプロジェクトに組み込まれており、大半のAPIのHTTP annotationsも完備している。

## ゴール

- `discovery/` パッケージを「buf Image JSON（protobuf）から直接 RestDescription を生成する」モードに置き換える
- 生成されるコードが機能的に劣らなければ、互換性・命名の変更は許容する
- Drive APIは対象外（コアDrive APIのprotoが存在しない）

## アプローチ

1. buf Image JSON を解析する新型定義（`proto_types.mbt`）を追加
2. proto image → RestDescription への変換層（`proto_converter.mbt`）を実装
3. `discovery/main.mbt` のCLIをprotoパッケージ名ベースに置き換える
4. `codegen.mbt` に最小変更（空prefixの関数名生成のみ）
5. 既存Discovery JSONパーサーは削除し、protobuf-onlyに移行する

## スコープ

### 含む
- buf Image JSON型定義
- proto → RestDescription コンバーター
  - HTTP annotations (`[google.api.http]`) の抽出
  - URLパスの正規化（`{name=pattern}` → `{name}`）
  - クエリパラメータの導出（path/body以外のスカラーフィールド）
  - protobuf型 → Discovery互換型マッピング
  - well-known types（Timestamp, Empty等）のハンドリング
- CLIの置き換え
- 対象10API（firestore, logging, monitoring, pubsub, storage, bigquery.storage, clouderrorreporting, cloudscheduler, cloudtasks, cloudtrace）の再生成

### 含まない
- Drive API（protoなし）
- gRPC streaming クライアントサポート（server-side streamingのみ）
- 型の完全な正確性（int64をInt64ではなくStringとして扱う等のJSON proto仕様準拠）
- 双方向streaming / client-side streaming

## 影響範囲

- `discovery/types.mbt` — proto型追加
- `discovery/parser.mbt` → 内容置き換え（`parse_proto_image`）
- `discovery/main.mbt` → CLI完全置き換え
- `discovery/codegen.mbt` → 1箇所修正（空prefix対応）
- 新規: `discovery/proto_types.mbt`
- 新規: `discovery/proto_converter.mbt`
- `generated/` 配下の全パッケージ → 再生成

## 成功の基準

- `moon check` が通る
- 生成済み10APIのパッケージが `moon test` を通過する
- Firestore sample が動作する（smoke test）
