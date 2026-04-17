# 完了報告: Discovery不要化（protobuf-only codegen）

## 実装内容

- `discovery/` の入力を Discovery JSON から buf Image JSON に置き換えました。
- `ProtoImage -> RestDescription` 変換レイヤーを新規実装し、既存の `generate_types` / `generate_client` / `generate_helpers` を再利用する構成に変更しました。
- discovery CLI を `moon run discovery -- <proto_package> [--image <path>] [--output <dir>]` に更新しました。
- `walk_resources_for_client` の空prefix時の関数名生成不具合を修正しました。
- 生成物は drive を削除し、対象API（storageを除く）をprotobufベースで再生成しました。

## 技術的な決定事項

- 生成中間表現は既存の `RestDescription` を継続利用し、移行コストを最小化しました。
- proto message の外部参照型は未定義型エラー回避のため `object` 相当として扱い、同一package内型のみ `$ref` を生成する方針にしました。
- `google.storage.v2` は buf image 内で `[google.api.http]` annotation が付与されていないため、proto-only変換対象から除外し、既存生成物を維持しました。

## 変更ファイル一覧

- 追加:
  - `discovery/proto_types.mbt`: buf image JSON 用の型定義
  - `discovery/proto_converter.mbt`: ProtoImage から RestDescription への変換
  - `docs/completed/20260417_protobuf_codegen.md`: 本完了報告
- 変更:
  - `discovery/parser.mbt`: `parse_proto_image` に置換
  - `discovery/main.mbt`: proto packageベースCLIに置換
  - `discovery/codegen.mbt`: 空prefix時の関数名生成修正
  - `discovery/codegen_wbtest.mbt`: proto変換系テスト追加、旧依存除去
  - `discovery/parser_wbtest.mbt`: parser対象を proto image に更新
  - `sample/firestore/main.mbt`: 新しい `list_documents` 呼び出しに更新
  - `sample/drive/main.mbt`, `sample/drive/moon.pkg`: drive生成削除後の整合用に非対応メッセージへ変更
  - `generated/*`（drive削除、対象API再生成）
  - `*pkg.generated.mbti`（`moon info` による更新）

## テスト

- `moon check`
- `moon test`

## 今後の課題・改善点

- `google.storage.v2` をprotobuf-onlyで生成するには、HTTP bindingの別ソース（service config等）を取り込む仕組みが必要です。
- 外部型参照の扱いは現在 `object` フォールバックのため、型安全性をさらに高める余地があります。

## 参考資料

- `docs/superpowers/plans/2026-04-17-protobuf-codegen.md`
- buf image: `/tmp/googleapis-image.json`
