# 完了報告: Firestore e2e テスト実装

## 実装内容
- `e2e/firestore/` パッケージに 6 つの e2e テストを実装
- `GOOGLE_ACCESS_TOKEN` / `GCP_PROJECT` 未設定時は自動スキップ
- `FIRESTORE_EMULATOR_HOST` で Firestore Emulator にも向けられる

## 技術的な決定事項
- **`guard expr is Some((...)) else { return }`** でのスキップパターン
  - `guard let Some(...) = expr` は MoonBit では無効
  - `guard expr is Pattern else { ... }` が正しい構文
- **`Iter` に `find` メソッドなし** → `find_field()` ヘルパー（for + break）で代替
- **ファイル: `e2e_test.mbt`（`_test.mbt` ではない）** + native ターゲット限定
  - `moon.pkg` の `targets` で `["native"]` を指定
- **コレクション名 `e2e_googleapis`** を固定し doc_id をテスト毎に分離
- 各テストで前後に `cleanup()` (async, error 無視) を呼び出し

## 変更ファイル一覧
- 新規: `e2e/firestore/moon.pkg` — 依存設定 + native ターゲット
- 新規: `e2e/firestore/e2e_test.mbt` — e2e テスト 6 件 + ヘルパー
- 新規: `docs/steering/20260417_firestore_e2e.md`

## テスト内容
| テスト名 | 検証内容 |
|---------|---------|
| create_document and get_document | 作成したドキュメントを取得して内容確認 |
| list_documents returns created document | リストにドキュメントが含まれることを確認 |
| update_document patches fields | フィールドが更新されることを確認 |
| delete_document removes document | 削除後 get_document がエラーになることを確認 |
| run_query filters documents by field | FieldFilter EQUAL でフィルタが機能することを確認 |
| commit batch write creates document | commit (batch write) でドキュメントが作成されることを確認 |

## 動作確認方法
```bash
# Firestore Emulator の場合
export FIRESTORE_EMULATOR_HOST="localhost:8080"
export GCP_PROJECT="your-project-id"
export GOOGLE_ACCESS_TOKEN="dummy"  # emulator は認証不要

# 実際の GCP の場合
export GOOGLE_ACCESS_TOKEN="$(gcloud auth print-access-token)"
export GCP_PROJECT="your-project-id"

moon test e2e/firestore --target native
```

## 今後の課題・改善点
- [ ] `begin_transaction` / `rollback` のテスト追加
- [ ] Firestore Emulator を使った CI 統合
- [ ] テスト後のコレクション全体のクリーンアップ
