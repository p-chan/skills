---
name: setup-oxc
description: oxfmt と oxlint を導入する。npm パッケージを使うリポジトリで、フォーマットやリントを新しく導入するときに使う。
---

# oxfmt / oxlint の導入

次の状態にする。

- `package.json` に `format`（`oxfmt`）、`format:check`（`oxfmt --check`）、`lint`（`oxlint`）、`lint:fix`（`oxlint --fix`）がある
- GitHub Actions があるときは、`format:check` と `lint` を実行している

## 設定

どちらもデフォルトで動くので、設定ファイルは理由があるときだけ作る。

- `.gitignore` は自動で尊重される。Git 管理下のファイルを除外するときだけ `ignorePatterns` を使う
- `sortImports` と `sortTailwindcss` を有効にするかは、ユーザーに確認する

## 既存コードへの導入

oxfmt の既定の `printWidth` は 100 なので、大きな整形差分が出ることがある。その場合は整形専用のコミットに分け、`.git-blame-ignore-revs` への記録をユーザーに提案する。

## type-aware lint

TypeScript のリポジトリでは、`oxlint-tsgolint` を入れ、ルートの設定ファイルに `options.typeAware: true` を書いて有効にする。`options.typeAware` はネストした設定ファイルには書けない。

次のいずれかに当てはまるときは見送る。

- TypeScript が 7.0 未満
- Project References の依存先をビルドしないと `.d.ts` が揃わず、ビルドを CI や開発フローに組み込めない
- `tsconfig.json` の `include` を絞れず、生成コードなどを大量に含む

## モノレポ

依存とスクリプトはルートにだけ置く。設定はディレクトリごとに最も近いファイルが適用されるので、パッケージごとの差はそのパッケージの設定ファイルに書く。
