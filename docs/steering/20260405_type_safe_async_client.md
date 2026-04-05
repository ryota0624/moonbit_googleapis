# Steering: Type-safe async generated clients

## 目的・背景
生成クライアントが `HttpRequest` のみ返し、呼び出し側で実行・パースが必要だった。`HttpClient` を渡して型付きレスポンスまで一括で返す。

## ゴール
- `pub async fn Service::method(self, client: &@http.HttpClient, ...) -> T raise @http.HttpError`
- Discovery の `response.$ref` から `T` を決定、無い場合は `@http.HttpResponse`
- 4xx/5xx と JSON 失敗は `HttpError` で通知

## アプローチ
- `discovery/codegen.mbt` の `write_rest_method` を拡張
- パッケージ外から `HttpError` を構築するため `HttpError::network_message` を `http` に追加

## スコープ
- 含む: codegen、再生成、`sample`、README の利用例、`http` ヘルパー
- 含まない: `core/GoogleService` の API 変更

## 影響範囲
- `discovery/codegen.mbt`, `generated/*/client.mbt`, `sample/*.mbt`, `http/types.mbt`, `README.mbt.md`
