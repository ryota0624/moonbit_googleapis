# Steering: Pub/Sub codegen修正とe2eテスト追加

## 目的・背景
`google.pubsub.v1` の生成クライアントが `SchemaService` のRPCのみを含み、`Publisher` と `Subscriber` の主要RPCが欠落している。これにより Pub/Sub の基本操作（Topic/Subscription/Publish/Pull/Acknowledge）を生成コード経由で利用・検証できない。

## ゴール
- `discovery/proto_converter.mbt` を修正し、`google.pubsub.v1` の全サービス（Publisher / Subscriber / SchemaService）のHTTP注釈付きRPCが1つの生成クライアントに反映される。
- `generated/pubsub` を再生成し、Topic/Subscription/Publish/Pull/Acknowledge などのメソッドが利用可能になる。
- Firestore再生成・既存e2e（firestore/storage）が回帰しないことを確認する。
- `e2e/pubsub` にエミュレータベースのe2eテストを追加し、少なくとも2シナリオを安定実行できる状態にする。

## アプローチ
- `proto_package_to_rest_description` のサービス走査ロジックを見直し、単一サービス選択ではなく複数サービスからRESTメソッドを集約する。
- 既存の単一 `RestDescription` / 単一 `*Service` 生成モデルは維持し、`resources[""]` 配下に複数サービス由来のメソッドを統合する。
- Pub/Sub Emulator（`google/cloud-sdk:emulators`）を testcontainers で起動し、NoAuth HTTP クライアントで接続する。

## スコープ
- 含む:
  - `discovery/proto_converter.mbt` の不具合修正
  - `generated/pubsub` / `generated/firestore` の再生成
  - `e2e/pubsub/moon.pkg` と `e2e/pubsub/e2e_test.mbt` の新規追加
  - 関連ドキュメント（steering/completed）の作成
- 含まない:
  - `generated/*` の手動編集
  - Pub/Sub のストリーミング専用機能（双方向StreamingPull）の厳密検証
  - Pub/Sub Emulator非対応機能の実装

## 影響範囲
- 変更対象:
  - `discovery/proto_converter.mbt`
  - `generated/pubsub/*`（再生成）
  - `generated/firestore/*`（再生成）
  - `e2e/pubsub/*`（新規）
  - `docs/completed/20260418_pubsub_codegen_and_e2e.md`（完了時）
- 影響:
  - Pub/Sub 生成クライアントAPIの公開面が拡張される。
  - 既存の生成・e2eフロー（Firestore/Storage）の継続互換性を保持する必要がある。
