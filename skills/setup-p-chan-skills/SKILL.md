---
name: setup-p-chan-skills
description: リポジトリに p-chan/skills のスキルを導入する。リポジトリに p-chan/skills のスキルを導入するときに使う。
---

# p-chan/skills のスキルの導入

`gh skill install p-chan/skills | cat` で一覧を取得し（パイプを通すと、対話的な選択ではなく一覧の出力になる）、ユーザーに提示して、導入するスキルを確認する。

選んだスキルが `.agents/skills/` に導入されていること。

```bash
gh skill install p-chan/skills <skill> --agent universal
```
