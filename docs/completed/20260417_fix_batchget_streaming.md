# 完了報告: batchGet streaming 名前不一致の修正

## 実装内容
- `scripts/extract_streaming.sh` の jq クエリを修正
  - proto RPC 名（`.name` = `"BatchGetDocuments"` 等）の代わりに、HTTP バインディング URL の `:` 以降のカスタム動詞を大文字化して出力するよう変更
  - 例: `/documents:batchGet` → `"BatchGet"`
- Firestore を再生成し、`batchGet` の戻り値型を `Array[BatchGetDocumentsResponse]` に修正

## 技術的な決定事項
- コード生成器側（`annotate_method_streaming`）は変更しない
  - 理由: `capitalize_first(last_dot_segment(rest_m.id))` が Discovery メソッド名を正規化する既存ロジックは正しい。問題は入力データ（streaming JSON）側にあった
- HTTP URL の `:` 以降をカスタム動詞として採用
  - 理由: buf image の `options["[google.api.http]"]` には全 streaming メソッドの URL に `:動詞` が含まれており、これが Discovery のメソッド名と一致することを全メソッドで確認した

## 変更ファイル一覧
- 変更:
  - `scripts/extract_streaming.sh`: jq クエリを HTTP カスタム動詞出力に変更
  - `generated/firestore/client.mbt`: Firestore 再生成（batchGet 戻り値型修正）
  - `generated/firestore/types.mbt`, `generated/firestore/helpers.mbt`: 再生成
  - `discovery/__snapshot__/codegen_wbtest.mbt.expect`: スナップショット更新
- 追加:
  - `docs/steering/20260417_fix_batchget_streaming.md`
  - `docs/completed/20260417_fix_batchget_streaming.md`

## テスト
- `bash scripts/extract_streaming.sh google.firestore.v1 /tmp/firestore_streaming.json` → `["BatchGet","RunQuery","ExecutePipeline","RunAggregationQuery","Write","Listen"]`
- `moon run discovery/ --target native -- /tmp/firestore.v1.discovery.json --output generated/firestore/ --server-streaming /tmp/firestore_streaming.json`
- `moon test --update` → 全 22 テスト通過
- `moon info && moon fmt` → エラー 0

## 今後の課題・改善点
- [ ] 他 API の再生成時も同様に `extract_streaming.sh` を使うフロー整備
- [ ] `Write`（双方向 streaming）は server_streaming=true で同様に `Array[T]` になっているが、実際の使用上問題ないか確認

## 参考資料
- buf image format: `options["[google.api.http]"]` の構造は `{post: "/v1/...:verb", body: "*"}` 形式
