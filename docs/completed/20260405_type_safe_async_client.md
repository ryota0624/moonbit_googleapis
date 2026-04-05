# 完了報告: Type-safe async generated clients

## 実装内容
- 生成メソッドを `async` とし、第2引数 `client : &@http.HttpClient` で実行。`response.$ref` がある場合は JSON パース後に該当スキーマ型を返し、無い場合は `@http.HttpResponse`。
- HTTP 4xx/5xx と `@json.parse` / `@json.from_json` の失敗は `raise @http.HttpError::network_message(...)` で統一（サブエラー直構築はパッケージ外不可のため）。
- `HttpError::network_message` を `http/types.mbt` に追加。

## 技術的な決定事項
- 呼び出し側は `let http = DefaultHttpClient::new(); let client = http as &@http.HttpClient` でトレイトオブジェクトを渡す。

## 変更ファイル一覧
- `discovery/codegen.mbt`, `discovery/codegen_wbtest.mbt`（スナップショット・Fixture に `FileList` / `response`）
- `http/types.mbt`, `generated/drive/*`, `generated/storage/*`（再生成）
- `sample/main.mbt`, `sample/storage/main.mbt`, `README.mbt.md`

## テスト
- `moon test`（20 件すべてパス）

## 参考
- Discovery の `response`: `MethodMedia.$ref`
