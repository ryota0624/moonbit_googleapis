# 完了報告: Cloud Tasks e2e 調査（実装は見送り）

## 実装内容
- Task C (Cloud Tasks e2e) の調査と prototype 実装を行った。
- `ghcr.io/aertje/cloud-tasks-emulator:latest` を `ryota0624/moonbit_test_containers` で起動する prototype を実装し、Firestore / Storage / Pub/Sub と同じ `NoAuthHttpClient` パターン・`make_queue` / `make_task` ヘルパー・`scenario_queue_lifecycle` / `scenario_task_lifecycle` を作成した。
- 結果として当 emulator は **gRPC 専用**で、`generated/cloudtasks` の REST/JSON クライアントと互換性がないと判明。リポジトリには commit せず撤去した。

## 技術的な決定事項
- **Cloud Tasks e2e はリポジトリへ commit しない**。
  - 理由: `ghcr.io/aertje/cloud-tasks-emulator` は gRPC 接続前提で、`curl` で `/v2/...` を叩くと `HTTP/2 INTERNAL_ERROR` もしくは応答なし (`000`) になり、`moon test e2e/cloudtasks` が `@http.HttpError.NetworkError` で必ず fail する。
  - README も gRPC クライアントから接続する運用を示しており、既知の互換性ギャップ。
- emulator 側を差し替える選択肢:
  - 公式 GCP 提供の Cloud Tasks emulator は存在しない。
  - 他 community emulator も調査した範囲では REST を提供しない、もしくは実装不完全。
- Plan (`/Users/ryota.suzuki/.claude/plans/humble-popping-spark.md`) でも「community emulator で REST 実装に欠落がある可能性」と予告されており、その通りの結論。

## 変更ファイル一覧
- 追加（commit 対象）:
  - `docs/steering/20260418_cloudtasks_e2e.md`: 本作業の steering
  - `docs/completed/20260418_cloudtasks_e2e.md`: 本完了報告（調査結果）
- 追加して取り下げ（リポジトリには commit しない）:
  - `e2e/cloudtasks/moon.pkg`
  - `e2e/cloudtasks/e2e_test.mbt`
  - `e2e/cloudtasks/pkg.generated.mbti`

## テスト
- 実施コマンド（prototype で検証したもの）:
  - `moon fmt` ✅
  - `moon check --target native` ✅
  - `moon test e2e/firestore --target native` ✅
  - `moon test e2e/storage --target native` ✅
  - `moon test e2e/pubsub --target native` ✅
  - `moon test e2e/cloudtasks --target native` ❌ (`HttpError.NetworkError` — emulator 互換性不足)
- 最終状態: `e2e/cloudtasks/` を撤去したため、リポジトリに失敗する e2e test は残っていない。

## 今後の課題・改善点
- [ ] REST/JSON 対応の Cloud Tasks emulator が登場したら再挑戦する。prototype のシナリオ設計（`scenario_queue_lifecycle`, `scenario_task_lifecycle`）は git 履歴から復元して流用可能。
- [ ] 必要性が高い場合、gRPC 直接呼び出し経路を MoonBit 側に追加するか、HTTP/JSON → gRPC のプロキシ (例: envoy gRPC-JSON transcoder) を emulator の前段に置く構成を検討する。
- [ ] `aertje/cloud-tasks-emulator` の upstream に REST エンドポイント追加が入れば再評価。

## 参考資料
- `e2e/firestore/e2e_test.mbt`, `e2e/storage/e2e_test.mbt`, `e2e/pubsub/e2e_test.mbt`
- `generated/cloudtasks/client.mbt`, `generated/cloudtasks/types.mbt`
- <https://github.com/aertje/cloud-tasks-emulator>
- `/Users/ryota.suzuki/.claude/plans/humble-popping-spark.md`
