# Steering: Firestore e2e テスト実装

## 目的・背景
`generated/firestore` の `FirestoreService` に対する e2e テストが存在しない。
app_skalton のテストパターンを参考に、実際の Firestore（または Emulator）に対して動作確認するテストを追加する。

## ゴール
- `e2e/firestore/` パッケージに e2e テストを実装
- `GOOGLE_ACCESS_TOKEN` / `GCP_PROJECT` 未設定時は自動スキップ
- `FIRESTORE_EMULATOR_HOST` 環境変数で Emulator を向けられる
- `moon test e2e/firestore --target native` で実行可能

## アプローチ
- `e2e/firestore/moon.pkg` + `e2e/firestore/e2e_test.mbt` を新規作成
- native ターゲットのみ（HTTP が native 限定）
- テスト固定コレクション `e2e_googleapis`、各テストで固有 doc_id を使用
- 各テスト前後にドキュメントをクリーンアップ

## スコープ

### 含む
- `create_document` + `get_document`
- `list_documents`
- `update_document` (パッチ更新)
- `delete_document` (削除後 get で error)
- `run_query` (FieldFilter EQUAL)
- `commit` (batch write)

### 含まない
- `begin_transaction` / `rollback`（今回は対象外）
- wasm / js ターゲット

## 影響範囲
- 新規: `e2e/firestore/moon.pkg`
- 新規: `e2e/firestore/e2e_test.mbt`

## 成功の基準
- `moon check` が通る
- 環境変数設定時に `moon test e2e/firestore --target native` が全テストパス
- 環境変数未設定時にテストがスキップ（パス）される
