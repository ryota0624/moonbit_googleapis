# Steering: 追加 Google API クライアント一括生成

## 目的・背景

Discovery codegen パイプラインで複数の Google Cloud API クライアントを一括自動生成する。

## 対象API

| API | Discovery名 | バージョン |
|-----|-------------|-----------|
| Firestore | firestore | v1 |
| Pub/Sub | pubsub | v1 |
| Cloud Tasks | cloudtasks | v2 |
| Cloud Scheduler | cloudscheduler | v1 |
| Cloud Logging | logging | v2 |
| Cloud Trace | cloudtrace | v2 |
| Error Reporting | clouderrorreporting | v1beta1 |
| Cloud Monitoring | monitoring | v3 |

## ゴール

- 上記8つのAPIクライアントを codegen で自動生成
- Firestore のドキュメント一覧取得サンプルを追加
- actrun ワークフローに全API追加

## アプローチ

### Step 1: 全APIクライアント一括生成

各APIのDiscovery Documentをダウンロードし、codegenで生成:

```bash
# Discovery Document ダウンロード
curl -o /tmp/firestore.json "https://www.googleapis.com/discovery/v1/apis/firestore/v1/rest"
curl -o /tmp/pubsub.json "https://www.googleapis.com/discovery/v1/apis/pubsub/v1/rest"
curl -o /tmp/cloudtasks.json "https://www.googleapis.com/discovery/v1/apis/cloudtasks/v2/rest"
curl -o /tmp/cloudscheduler.json "https://www.googleapis.com/discovery/v1/apis/cloudscheduler/v1/rest"
curl -o /tmp/logging.json "https://www.googleapis.com/discovery/v1/apis/logging/v2/rest"
curl -o /tmp/cloudtrace.json "https://www.googleapis.com/discovery/v1/apis/cloudtrace/v2/rest"
curl -o /tmp/clouderrorreporting.json "https://www.googleapis.com/discovery/v1/apis/clouderrorreporting/v1beta1/rest"
curl -o /tmp/monitoring.json "https://www.googleapis.com/discovery/v1/apis/monitoring/v3/rest"

# 各API生成
for api in firestore pubsub cloudtasks cloudscheduler logging cloudtrace clouderrorreporting monitoring; do
  moon run discovery/ --target native -- /tmp/$api.json --output generated/$api
  moon fmt generated/$api
done
moon info && moon check
```

### Step 2: actrun ワークフロー更新

`.github/workflows/generate.yml` に全APIを追加

### Step 3: Firestore サンプルコード

`sample/firestore/` を新規作成:
- `moon.pkg`: generated/firestore を import（alias `@gfs`）
- `main.mbt`: Firestore ドキュメント一覧取得
- `main_wasm.mbt`: wasm スタブ

### Step 4: 検証

- `moon check` 0エラー 0警告
- `moon test` 全パス
- `moon build --target native` 成功

## スコープ

### 含む
- 8つのAPIクライアント自動生成
- Firestore サンプル
- actrun ワークフロー更新

### 含まない
- gRPC/WebSocket対応（REST APIのみ）
- 各APIの個別サンプル（Firestore以外）

## 影響範囲

- 生成: `generated/{firestore,pubsub,cloudtasks,cloudscheduler,logging,cloudtrace,clouderrorreporting,monitoring}/`
- 新規: `sample/firestore/`
- 変更: `.github/workflows/generate.yml`
