# Steering: repeated query parameter support

## 目的・背景
Discovery Document の `MethodParameter.repeated` を codegen が無視しており、Firestore の `mask.fieldPaths` のような repeated query parameter を正しく生成できない。

## ゴール
- `repeated: true` な query parameter を `Array[...]?` として生成する。
- 生成クライアントで query push をループ展開し、同一キーを複数回付与できる。
- 既存 snapshot test と生成物を更新し、Firestore GET 系メソッド移行の前提を整える。

## アプローチ
- `discovery/types.mbt` に `MethodParameter.repeated` を追加して JSON から取り込む。
- `discovery/codegen.mbt` に repeated 判定ロジックを追加し、query 引数型生成と push 生成を分岐する。
- `discovery/codegen_wbtest.mbt` のスナップショット入力/期待値に repeated query parameter ケースを追加する。
- Firestore/Cloud Trace/Logging/Cloud Error Reporting を再生成する。

## スコープ
- 含む: discovery codegen、関連テスト、生成 API クライアント更新
- 含まない: app 側 Firestore クライアント移行（別タスク）

## 影響範囲
- `discovery/types.mbt`
- `discovery/codegen.mbt`
- `discovery/codegen_wbtest.mbt`
- `generated/firestore`, `generated/cloudtrace`, `generated/logging`, `generated/clouderrorreporting`
