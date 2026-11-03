---
name: setup-typescript
description: TypeScript を導入し、`@tsconfig/bases` のベースに `@tsconfig/strictest` を重ねる。TypeScript を新しく導入するときに使う。
---

# TypeScript の導入

次の状態にする。

- 型チェックの対象になる各 tsconfig が、選定したベースと `@tsconfig/strictest` を `extends` し、リポジトリのソースを指す `include` を持っている
- `typecheck` スクリプトが成功する
- GitHub Actions があるときは、`typecheck` を実行している

## ベースの選定

[@tsconfig/bases](https://github.com/tsconfig/bases) の現在の一覧から、最初に該当するものを 1 つ選ぶ。

1. 使用しているフレームワークの専用ベース
2. Node.js 以外のランタイムの専用ベース
3. リポジトリで固定している Node.js メジャーバージョンのベース
4. Node.js LTS のベース
5. 汎用のベース

## `types`

`types` の既定値は `[]` で、`@types` は自動で読み込まれない。

実際に Node.js 上で動くファイルを対象とする tsconfig には、`@types/node` を入れ、`types` に `"node"` が含まれるようにする。ベースが `types` を設定していることがあるので、`tsc --showConfig` で確認する。ブラウザのみのコードや、Bun など独自のグローバル型を持つランタイムには追加しない。

## tsconfig の分割

ブラウザ向けの `src` と Node.js で動く `vite.config.ts` のように、実行環境が異なるファイルがあるときは分割する。

- ルートの `tsconfig.json` は `"files": []` と `references` だけを持つ
- 実行環境ごとのサブ設定に `noEmit: true` を指定する
- `typecheck` スクリプトは `tsc -b` にする

分割しないときの `typecheck` スクリプトは `tsc --noEmit` にする。

## モノレポ

- `typescript` はルートに 1 回だけ入れる。ベースと `@types/node` は該当パッケージに入れる
- tsconfig はパッケージごとに作り、パッケージ間を Project References で束ねない
