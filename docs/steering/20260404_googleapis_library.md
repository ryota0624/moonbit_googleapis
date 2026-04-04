# Steering: Google REST API クライアントライブラリの作成

## 目的・背景

MoonBitからGoogle REST APIを汎用的に呼び出せるクライアントライブラリを作成する。MoonBitはHTTP/2をサポートしていないが、Google REST APIはHTTP/1.1で完全に動作するため問題ない。`mizchi/x/http`（+ `moonbitlang/async/http`）がnative/js両方で動くHTTP/1.1クライアントを既に提供しており、これをHTTPバックエンドとして使用する。

既存の`moonbit_googleauth`（認証ライブラリ）とは独立したプロジェクトとし、任意で連携可能な設計にする。

## ゴール

- 任意のGoogle REST APIを呼び出せる汎用クライアントライブラリ
- native（Linux/macOS）とjs（ブラウザ/Node.js）の両バックエンド対応
- Google Discovery Documentからの型付きAPIクライアントコード自動生成
- 初期マイルストーンとしてGoogle Drive API v3のサブセットが動作すること

### 成功の基準

1. `moon check` で全パッケージがコンパイル通過
2. `moon test` でユニットテストが全てパス
3. Drive API の files.list/get/create が動作（要認証トークン）
4. Discovery Document からMoonBitコードが生成できる

## アプローチ

### アーキテクチャ: モノリポ型

1つの `moon.mod` に複数パッケージを配置する構成。

```
moonbit_googleapis/
├── moon.mod.json          # ryota0624/googleapis
├── http/                  # HttpClient trait + mizchi/x/httpラッパー
├── core/                  # Google API共通基盤（認証、エラー、ページネーション）
├── discovery/             # Discovery Document パーサー + コード生成CLI
├── services/drive/        # 生成されたDrive API クライアント（初期マイルストーン）
└── sample/                # 使用例
```

### HTTP抽象化

`HttpClient` trait を定義し、デフォルト実装を `mizchi/x/http` で提供。テスト時のモック差し替えにも対応。

```moonbit
pub(open) trait HttpClient {
  request(Self, HttpRequest) -> HttpResponse!HttpError
}
```

### 認証連携

moonbit_googleauthへの直接依存は持たない。トークン文字列（`String`）を受け取る設計とし、ユーザーが任意の認証手段を使えるようにする。

### Discovery Document コード生成

Google Discovery Document（JSON）を読み込み、MoonBitのソースコードを生成するCLIツール:
- `schemas` → MoonBit struct 型定義
- `resources.*.methods` → API メソッド関数
- `parameters` → クエリパラメータをオプション引数に変換

### 依存ライブラリ

- `mizchi/x` 0.1.3 - HTTP client（native + js対応）
- `moonbitlang/async` 0.16.6 - async runtime

## スコープ

### 含む
- HTTP抽象化層（trait + デフォルト実装）
- Google API共通基盤（認証ヘッダー、エラーパース、ページネーション）
- Discovery Document パーサーとコード生成ツール
- Drive API v3 クライアント（files.list/get/create）
- 使用例サンプルコード

### 含まない
- 認証・トークン取得の実装（moonbit_googleauthの責務）
- gRPC/HTTP/2対応
- ファイルアップロード（マルチパート）の初期実装
- Drive API以外のサービス（初期マイルストーンでは）

## 影響範囲

- 新規プロジェクト `~/git/moonbit_googleapis/` のみ
- 既存の `moonbit_googleauth` への変更なし

## 実装フェーズ

1. **Phase 1**: プロジェクト初期化（moon new、ドキュメントコピー、依存設定）
2. **Phase 2**: HTTP抽象化層（HttpClient trait、型定義、デフォルト実装）
3. **Phase 3**: Core層（GoogleService、認証、エラー、ページネーション）
4. **Phase 4**: Discovery Document コード生成
5. **Phase 5**: Drive API クライアント（手動実装→生成コード比較）
6. **Phase 6**: サンプルコード
