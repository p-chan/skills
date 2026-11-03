---
name: github-actions
description: GitHub Actions のワークフローを書く。ワークフローを作成・変更するときに使う。
---

# GitHub Actions

このスキルは新しく書く部分に適用する。既存の部分は、依頼があるときに変える。

## Actions の固定

外部の Actions は SHA で固定し、タグをコメントで残す。

```yaml
- uses: actions/checkout@<SHA> # <最新タグ>
```

## ジョブの粒度

フォーマットチェック、リント、型チェック、テスト、ビルドなどの検証は、それぞれ別のジョブにする。どれが失敗したかを PR のステータスチェック一覧で判別できる。

## Action ごとのリファレンス

- `actions/setup-node` を使うときは、[references/setup-node.md](references/setup-node.md) を読む
- `pnpm/action-setup` を使うときは、[references/pnpm-action-setup.md](references/pnpm-action-setup.md) を読む
