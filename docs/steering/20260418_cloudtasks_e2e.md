# Steering: Cloud Tasks e2e テスト実装（community emulator）

## 目的・背景
Cloud Tasks 生成クライアント（`generated/cloudtasks`）の主要操作が、ローカル実行可能な community emulator 上で実際に疎通できることを継続的に確認したい。既存の Firestore / Storage / Pub/Sub e2e と同じ testcontainers パターンで、Cloud Tasks の回帰検知を可能にする。

## ゴール
- `e2e/cloudtasks` パッケージを追加し、`moon test e2e/cloudtasks --target native` で Cloud Tasks e2e を実行できる状態にする。
- Queue ライフサイクルと Task ライフサイクルの 2 シナリオを実装する。
- `TasksService::new(..., base_url=Some(...))` による emulator 接続を明示する。

## アプローチ
- 既存 e2e と同様に `NoAuthHttpClient` を実装し、Authorization ヘッダーを除去して emulator へ接続する。
- `ghcr.io/aertje/cloud-tasks-emulator:latest` を testcontainers で起動し、`TcpPort(8123)` を待機条件にする。
- Queue/Task は `@json.from_json(Json::object(...))` で構築し、generated 型の JSON フィールド名（camelCase）に合わせる。
- emulator の挙動差異（REST 非対応など）がある場合は結果を完了ドキュメントに記録する。

## スコープ
- 含む:
  - `e2e/cloudtasks/moon.pkg` 新規作成
  - `e2e/cloudtasks/e2e_test.mbt` 新規作成
  - `docs/steering/20260418_cloudtasks_e2e.md` / `docs/completed/20260418_cloudtasks_e2e.md` 作成
- 含まない:
  - `generated/` 配下の直接修正
  - Cloud Tasks emulator の upstream 修正
  - 既存 e2e シナリオ内容の変更

## 影響範囲
- 追加: `e2e/cloudtasks/moon.pkg`
- 追加: `e2e/cloudtasks/e2e_test.mbt`
- 追加: `docs/steering/20260418_cloudtasks_e2e.md`
- 追加予定: `docs/completed/20260418_cloudtasks_e2e.md`
- 関連確認: `moon fmt`、`moon check --target native`、`moon test e2e/cloudtasks --target native`、既存 e2e 実行、`moon info`
