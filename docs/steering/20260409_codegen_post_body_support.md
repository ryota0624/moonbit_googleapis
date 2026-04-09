# Steering: コード生成器 POST Request Body対応

## 目的・背景

現在のコード生成器は、POSTメソッドのリクエストボディを常に空の`{}`として生成する。Discovery DocumentのRestMethodには`request`フィールド（`$ref`でリクエストボディ型を指す）があるが、コード生成器がこのフィールドを無視している。

これにより、Firestore commit/run_query、Cloud Logging entries:write、Cloud Trace batchWrite等のPOST系メソッドが実質的に使用不可能になっている。

## ゴール

- `rest_m.request`フィールドを読み取り、POSTメソッドに`request`パラメータを追加
- リクエストボディをrequestオブジェクトから直接シリアライズ
- 既存のGET/query parameter系メソッドに影響を与えない
- 生成される型にToJson deriveを追加

## アプローチ

### 修正対象: `discovery/codegen.mbt`

#### 1. メソッドシグネチャにrequestパラメータ追加 (write_rest_method, L572-595付近)

`rest_m.request`がSome(MethodMedia { ref_: Some(r) })の場合:
- パスパラメータの後に `request : <RequestType>` パラメータを追加
- `ref_to_type_name(r)` で型名を取得（既存関数を再利用）

#### 2. ボディ構築をrequest直接シリアライズに変更 (L607-620付近)

`rest_m.request`がある場合:
```
let body = @json.to_json(request).stringify()
```
ない場合は従来通り個別パラメータからbody構築。

#### 3. use_body判定の修正

`rest_m.request`がある場合も`use_body = true`にする。

#### 4. 型定義にToJson derive追加 (generate_types)

全structに`ToJson(rename_fields="camelCase")`を追加。

### テスト更新: `discovery/codegen_wbtest.mbt`

スナップショットテストを更新して新しい出力を検証:
- requestパラメータが存在するPOSTメソッドのシグネチャ
- bodyがrequestからシリアライズされること

### API再生成

修正後、以下のAPIを再生成:
- generated/firestore/
- generated/cloudtrace/
- generated/logging/
- generated/clouderrorreporting/

## スコープ

- 含む: codegen修正、ToJson追加、API再生成、テスト更新
- 含まない: app_skalton側のリファクタリング（別タスク）

## 完了条件

- `moon check` 通過
- `moon test` 通過（スナップショット更新済み）
- 再生成されたメソッドにrequestパラメータが含まれること
- 変更をコミット
