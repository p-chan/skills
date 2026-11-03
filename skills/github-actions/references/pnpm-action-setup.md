# pnpm/action-setup

- `actions/setup-node` より前に置く
- `package.json` に `packageManager` があるときは、`version` を省略する。指定元を 1 か所にするため
- `actions/setup-node` に `cache: pnpm` を指定する
- `pnpm install` に `--frozen-lockfile` は付けない。CI 環境では自動で同じ挙動になる
