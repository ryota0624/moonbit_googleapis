# Steering: ストリーミング対応コード生成器修正

## 目的・背景
Discovery Document ベースの生成コードでは、server-streaming RPC の戻り値が単一型として生成される。Firestore などでは実際に配列レスポンスとなるため、型不整合が発生する。
この差分を吸収するため、googleapis proto から server-streaming メタデータを抽出してコード生成に反映する。

## ゴール
- `googleapis` submodule が追加されている
- `scripts/extract_streaming.sh` で server-streaming RPC 名一覧を JSON 配列として抽出できる
- `discovery` 生成器が `--server-streaming` 引数で抽出結果を読み込み、該当 RPC の戻り値を `Array[T]` として生成する
- Firestore 再生成結果で `run_query` の戻り値が `Array[RunQueryResponse]` になる

## アプローチ
- `RestMethod` に `server_streaming : Bool` を追加し、Discovery JSON 由来では既定値 `false` にする
- `discovery/main.mbt` で `--server-streaming <file>` を受け取り、`RestDescription` を再帰走査して該当メソッドにフラグを付与する
- `discovery/codegen.mbt` の戻り値型決定ロジックを `server_streaming` 対応に変更する
- whitebox テストを追加して戻り値型生成を固定化する

## スコープ
- 含む: submodule 追加、抽出スクリプト追加、discovery 生成器・テスト修正、Firestore 再生成
- 含まない: 抽出対象パッケージの自動検出、他 API の一括再生成ロジック変更

## 影響範囲
- `googleapis/` (git submodule)
- `scripts/extract_streaming.sh`
- `discovery/types.mbt`
- `discovery/main.mbt`
- `discovery/codegen.mbt`
- `discovery/codegen_wbtest.mbt`
- `generated/firestore/*`
- `pkg.generated.mbti` / `discovery/pkg.generated.mbti`（`moon info` 実行による更新）
