---
name: setup-node-version
description: リポジトリの Node.js バージョンを固定する。`.node-version` で Node.js のバージョンを新しく固定するときに使う。
---

# Node.js

次の状態にする。

- `.node-version` が `x.y.z` 形式で存在し、`package.json` の `engines.node` を満たしている
- `.nvmrc` が存在しない。mise は `.nvmrc` を `.node-version` より優先する
- GitHub Actions で `actions/setup-node` を使っているときは、`node-version-file` で `.node-version` を読んでいる

## バージョン

既定は Active LTS で、`mise latest node@lts > .node-version` で生成する。

Current は、LTS にない機能が必要なときだけ使う。
