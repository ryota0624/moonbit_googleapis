# Steering: NullValue フィールドの JSON デコード不具合修正

## 目的・背景

`generated/firestore/types.mbt` の `Value.null_value` が `String?` として生成されており、
Firestore REST API が返す `{"nullValue": null}` をデコードできず下記エラーになる:

```
JsonDecodeError((/documents/0/fields/.../nullValue, "String::from_json: expected string"))
```

原因: proto3 の `google.protobuf.NullValue` enum は JSON で常に `null` として表現される
(proto3 JSON mapping 仕様)。しかし codegen が他の enum と同じく `String` にマップしているため、
`Option[String]::from_json(null)` が失敗する。

下流プロジェクト `firestire_cli` ではローカルパッチ (`null_value : Json?`) で回避済み。
本 PR で上流 codegen を修正する。

## ゴール

- `google.protobuf.NullValue` 型のフィールドを `Json?` にマップ
- Firestore を再生成して `Value.null_value: Json?` になる
- 既存の firestore テストがパス
- `Some(Json::Null)` をシリアライズすると `"nullValue": null` になる (proto3 仕様準拠)
- 新しいバージョンをリリース可能な状態にする

## アプローチ

CLAUDE.md 規約に従い `generated/` を直接編集せず、`codegen/` のみを修正する。

1. `codegen/proto_converter.mbt` の `proto_field_to_schema` 関数に、
   `f.type_name == Some(".google.protobuf.NullValue")` の早期判定を追加
   - `JsonSchema::{ type_: Some("object") }` を返す → `schema_to_field_type` で `Json` にマップされる
   - TYPE_ENUM 経由と TYPE_MESSAGE 経由のどちらでも効くよう、
     type_ 分岐より手前に置く (防御的プレースメント)
2. Firestore パッケージを再生成
3. `moon check` と `moon test` で検証
4. wbtest に Value デコードテストを追加 (nullValue を含む JSON の round-trip)

## スコープ

含む:
- `codegen/proto_converter.mbt` の修正
- Firestore パッケージの再生成 (`types.mbt`, `pkg.generated.mbti`, ほか影響ファイル)
- NullValue JSON round-trip テスト

含まない:
- 他 API パッケージ (spanner, bigtable 等) の再生成 — 別 PR
- 下流 `firestire_cli` 側の対応

## 影響範囲

- `codegen/proto_converter.mbt` (手動編集)
- `generated/firestore/types.mbt` (再生成で `null_value : Json?` になる)
- `generated/firestore/pkg.generated.mbti` (再生成)
- `generated/firestore/client.mbt` / `helpers.mbt` (null_value を参照していたら再生成)

## 参考

- proto3 JSON mapping: https://protobuf.dev/programming-guides/proto3/#json
- 下流パッチ: `firestire_cli/.mooncakes/ryota0624/googleapis/generated/firestore/types.mbt`
