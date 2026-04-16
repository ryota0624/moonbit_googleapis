# Steering: batchGet streaming 名前不一致の修正

## 目的・背景
Firestore の `batchGet` が server-streaming にもかかわらず `BatchGetDocumentsResponse`（単体）を返していた。
Discovery API のメソッド名（`batchGet`）と proto RPC 名（`BatchGetDocuments`）が異なるため、`extract_streaming.sh` が出力する名前がコードジェネレータのマッチングに失敗していた。

## ゴール
`projects_databases_documents_batch_get` の戻り値型が `Array[BatchGetDocumentsResponse]` になること。

## アプローチ
- `scripts/extract_streaming.sh` の jq クエリを修正し、proto RPC 名（`.name`）の代わりに HTTP カスタム動詞（URL の `:` 以降）を大文字化して出力する
- コード生成器側（`discovery/main.mbt` の `annotate_method_streaming`）は変更しない

## スコープ
- 含む: `extract_streaming.sh` の修正、Firestore 再生成
- 含まない: コード生成器本体の変更、他 API の再生成

## 影響範囲
- `scripts/extract_streaming.sh`
- `generated/firestore/client.mbt`（再生成）
