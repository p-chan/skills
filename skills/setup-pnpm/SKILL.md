---
name: setup-pnpm
description: pnpm を導入する。npm パッケージを使うリポジトリで、パッケージマネージャーを新しく導入するときに使う。
---

# pnpm の導入

`package.json` の `packageManager` に、`npm view pnpm version` で確認した最新版を `pnpm@x.y.z` の形式で指定する。

Corepack は使わない。pnpm は `packageManager` のバージョンを自動でダウンロードして切り替える。

導入済みの別のパッケージマネージャーがあるときは、変更せずにユーザーに報告する。

## 設定

設定は `pnpm-workspace.yaml` に書く。`.npmrc` から読まれるのは認証、レジストリ、TLS、プロキシ、`local-address` の設定だけで、それ以外は無視される。単一パッケージのリポジトリでは `packages` を省略できる。

次の場合は、指定の設定を使う。

- **アプリケーション:** `savePrefix: ""` で exact 固定にする。バージョンアップが `package.json` の差分に現れ、ロックファイルを作り直しても意図しない更新が混ざらない。公開ライブラリは、利用者側で依存が重複しやすくなるので設定しない
- **`pnpm install` 後の解決エラー:** `publicHoistPattern` を優先する。`shamefullyHoist: true` は最終手段で、ユーザーに確認してから使う
