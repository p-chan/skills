---
name: github-actions
description: GitHub Actions のワークフローを書く。ワークフローを作成・変更するときに使う。
---

# GitHub Actions

## Actions の固定

外部の Actions は SHA で固定し、タグをコメントで残す。

```yaml
- uses: actions/checkout@<SHA> # <最新タグ>
```

## ジョブの粒度

フォーマットチェック、リント、型チェック、テスト、ビルドなどの検証は、それぞれ別のジョブにする。どれが失敗したかを PR のステータスチェック一覧で判別できる。
