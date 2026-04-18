# 完了報告: NullValue JSON decode/encode 修正

## 実装内容

proto3 JSON マッピングに従い、`google.protobuf.NullValue` を `String?` ではなく `Json?` として生成するように codegen を修正した。これにより Firestore REST API の `{"nullValue": null}` レスポンスを正しく decode/encode できるようになった。

## 技術的な決定事項

- `codegen/proto_converter.mbt` で `type_name == ".google.protobuf.NullValue"` を `type_` match の前段で検出し、`type_: Some("object")` を返すことで MoonBit の `Json` 型にマップする
  - 理由: proto3 JSON mapping 仕様では `NullValue` は JSON の `null` として表現される（文字列 `"NULL_VALUE"` ではない）
  - `type_` match の前に置くことで `TYPE_ENUM` / `TYPE_MESSAGE` どちらの経由でも対応
- `generated/` は直接編集せず、`codegen/` を修正してから再生成（CLAUDE.md の方針に従う）
- decode 側（`FromJson`）と encode 側（`ToJson`）の両方で回帰テストを追加

## 変更ファイル一覧

- 追加:
  - `docs/steering/20260418_null_value_json_decode_fix.md`: steering doc
  - `docs/completed/20260418_null_value_json_decode_fix.md`: 本ドキュメント
- 変更:
  - `codegen/proto_converter.mbt`: NullValue → Json マッピング追加
  - `codegen/codegen_wbtest.mbt`: codegen の unit test 追加
  - `generated/firestore/types.mbt`: 再生成（`null_value: String?` → `null_value: Json?`）
  - `generated/firestore/pkg.generated.mbti`: 再生成（同上）
  - `e2e/firestore/e2e_test.mbt`: decode/encode roundtrip test 追加
  - `e2e/firestore/moon.pkg`: `@json` import 追加
  - `moon.mod.json`: version bump 0.4.0 → 0.4.1

## テスト

- codegen unit test: 13件パス（1件追加）
- e2e firestore decode test: 1件追加、パス
- e2e firestore encode roundtrip test: 1件追加、パス
  - `Value { null_value: Some(Json::null()) }.to_json().stringify()` が `{"nullValue":null}` になることを確認
- `moon check --target native`: パス

## 今後の課題・改善点

- [ ] 他の google.protobuf wrapper 型（`DoubleValue`, `Int64Value` 等）で同様の spec ズレがないか調査
- [ ] emulator 統合の e2e（`scenario_*`）で実際の Firestore REST レスポンスに `nullValue` を含むケースを追加

## 参考資料

- [proto3 JSON mapping spec (NullValue)](https://protobuf.dev/programming-guides/json/#json-null-value)
- docs/steering/20260418_null_value_json_decode_fix.md
