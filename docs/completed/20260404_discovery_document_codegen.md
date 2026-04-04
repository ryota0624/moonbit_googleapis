# 完了報告: Discovery Document パーサーとコード生成（Phase 4）

## 実装内容

- `discovery/types.mbt`: `RestDescription`, `JsonSchema`, `RestResource`, `RestMethod`, `MethodParameter`, `MethodMedia`, `pub suberror ParseError`（`derive(Show)`）
- `discovery/parser.mbt`: `parse_discovery`（`@json.parse` + 再帰的オブジェクト走査）、`$ref` は `"$" + "ref"` でキー化
- `discovery/codegen.mbt`: `to_snake_case`, `generate_types`, `generate_client`（ネストした `resources` をプレフィックス付きで走査）
- `discovery/main.mbt`: **native / js** のみビルド対象の `async fn main`（引数に JSON パス、型とクライアントスタブを標準出力へ）
- `discovery/main_wasm.mbt`: **wasm / wasm-gc** 用スタブ（`run_async_main` 非対応のため）
- `discovery/moon.pkg`: 上記ターゲット振り分け、`warnings = "-0029"`（wasm で CLI 未使用の依存に対する unused 抑制）
- テスト: `parser_test.mbt`, `codegen_test.mbt`（スナップショット含む）

## 技術的な決定事項

- **エラー**: `pub suberror ParseError` + `raise`（`derive(Show)` はブロックの後に記述）
- **async main**: wasm-gc ではツールチェーンが `run_async_main` を提供しないため、エントリをターゲット別ファイルに分割
- **ルート全体の `moon info` / `moon check`**: 現状 `http/` パッケージに既存のコンパイルエラーがあり失敗する。`discovery` のみは `moon check discovery` / `moon info discovery` で問題なし

## 変更ファイル一覧

- 追加: `discovery/types.mbt`, `parser.mbt`, `codegen.mbt`, `main.mbt`, `main_wasm.mbt`, `parser_test.mbt`, `codegen_test.mbt`, `pkg.generated.mbti`, `docs/steering/20260404_discovery_document_codegen.md`, 本ファイル
- 変更: `discovery/moon.pkg`

## テスト

- `moon test discovery`（3 件すべてパス）
- `moon check discovery` / `moon check discovery --target native`

## 今後の課題

- メインパッケージに `_test.mbt` があることに関する Moon の警告（将来はライブラリパッケージと `cmd/` エントリの分離を検討）
- 生成コードの品質（認証、クエリ引数、リクエスト/レスポンスボディ型の詳細化）

## 参考

- [Google Discovery Service](https://developers.google.com/discovery/v1/reference/apis)
