# Steering: Discovery Document パーサーとコード生成（Phase 4）

## 目的・背景

Google Discovery Document（JSON）を MoonBit で読み取り、スキーマと REST メソッドから MoonBit ソースのたたき台を生成する CLI を `discovery/` に実装する。

## ゴール

- `RestDescription` ほかの型で Discovery を表現し、`parse_discovery` でパースできる
- `generate_types` / `generate_client` で文字列コードを生成する
- `moon check` / `moon test` が通る

## アプローチ

- `@json.parse` で `Json` にし、オブジェクトマップを手で走査して再帰的に構築
- コード生成は文字列連結（スナップショットで振る舞いを固定）

## スコープ

- 含む: 最小限のフィールド、再帰 resources、テスト用ミニマル JSON
- 含まない: 完全な Google 全 API 互換、実 HTTP クライアント呼び出し

## 影響範囲

- `discovery/` 配下の `.mbt` と `moon.pkg`
