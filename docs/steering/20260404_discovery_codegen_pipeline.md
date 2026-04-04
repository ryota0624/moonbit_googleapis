# Steering: Discovery → generated/ コード自動生成パイプライン

## 目的・背景

現在 `services/drive/` は手書きだが、Discovery Document からコード生成で同等品質のコードを自動生成したい。actrun を使ってローカルで「Discovery JSONダウンロード → codegen → moon check → moon fmt」の全自動パイプラインをワークフローとして実行する。

## ゴール

1. `discovery/codegen.mbt` が手書き `services/drive/` 相当の品質のコードを生成する
2. actrun ワークフローで全自動パイプラインが動く
3. `generated/drive/` が `moon check` を通り、サンプルから使える

### 成功基準

- `actrun workflow run .github/workflows/generate.yml` で生成完了
- 生成された `generated/drive/` が `moon check` エラー0
- 生成コードで Drive API files.list が動作する

## アプローチ

### 1. codegen の拡張

**types.mbt 生成の改善:**
- `pub(all) struct` + `derive(Eq, Show, FromJson(rename_fields="camelCase"))`
- required でないフィールド → `T?`
- `$ref` → 同パッケージ内の型名に解決
- 予約語回避（type → type_, ref → ref_）+ `fields(type_(rename="type"))` 生成

**client.mbt 生成:**
- `{ApiName}Service` struct（base_url, access_token）
- `::new(access_token)` コンストラクタ
- 各 method → リクエスト構築関数
  - パスパラメータ（`{fileId}`）→ 必須引数
  - クエリパラメータ → オプション引数 `param? : Type? = None`
  - `GET`: クエリパラメータ組み立て
  - `POST/PUT/PATCH`: JSON body 構築
  - 認証ヘッダー（Bearer token）自動付与
  - 戻り値: `@http.HttpRequest`

**helpers.mbt 生成:**
- `build_query_string`, `url_encode`（全APIで共通）

**moon.pkg 生成:**
- import { "ryota0624/googleapis/http" @http } + 必要な依存

### 2. ファイル出力機能

`discovery/main.mbt` に `--output` オプション追加:
```
moon run discovery/ --target native -- drive.json --output generated/drive
```

出力時:
- `generated/{api}/types.mbt` - 型定義
- `generated/{api}/client.mbt` - Service + メソッド
- `generated/{api}/helpers.mbt` - 共通ヘルパー
- `generated/{api}/moon.pkg` - パッケージ設定

### 3. actrun ワークフロー

`.github/workflows/generate.yml`:

```yaml
name: Generate API clients
on: workflow_dispatch

jobs:
  generate-drive:
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v4
      - name: Download Drive Discovery Document
        run: curl -o /tmp/drive_discovery.json "https://www.googleapis.com/discovery/v1/apis/drive/v3/rest"
      - name: Generate Drive client
        run: moon run discovery/ --target native -- /tmp/drive_discovery.json --output generated/drive
      - name: Format
        run: moon fmt generated/drive
      - name: Check
        run: moon check
      - name: Test
        run: moon test
```

実行: `actrun workflow run .github/workflows/generate.yml`

## スコープ

### 含む
- codegen の types/client/helpers/moon.pkg 生成
- --output オプションによるファイル書き出し
- actrun ワークフロー定義
- Drive API での検証

### 含まない
- jsonschema/codegen 統合（別タスク）
- 複数API一括生成（将来拡張、ワークフローにjob追加するだけ）
- services/ の手書きコード削除（generated/ と並存させ、移行後に削除）

## 影響範囲

- 変更: `discovery/codegen.mbt`, `discovery/main.mbt`
- 新規: `generated/drive/`, `.github/workflows/generate.yml`
- 既存の `services/drive/` は変更なし（並存）

## 実装フェーズ

1. **Phase A**: codegen types.mbt 改善（derive, Option, pub(all), 予約語）
2. **Phase B**: codegen client.mbt 生成（Service struct, メソッド, パラメータ）
3. **Phase C**: codegen helpers.mbt + moon.pkg 生成
4. **Phase D**: --output ファイル出力機能
5. **Phase E**: actrun ワークフロー定義 + 検証
