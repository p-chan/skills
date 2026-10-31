---
name: setup-skills
description: リポジトリにスキルを導入する。リポジトリにスキルを導入するときに使う。
---

# スキルの導入

完了条件をすでに満たしている手順はスキップする。

## 1. スキルの置き場所を作る

`.agents/skills/` ディレクトリがあり、`.claude/skills` が `../.agents/skills` へのシンボリックリンクであること。

```bash
mkdir -p .agents/skills .claude
[ -e .claude/skills ] || ln -s ../.agents/skills .claude/skills
```

スキルはエージェント間で共通の置き場所である `.agents/skills/` に集約し、Claude Code とはシンボリックリンクで共有する。そのため、以降の手順では `gh skill install` に、`.agents/skills/` を導入先にする `--agent universal` を付ける。

`.claude/skills` がシンボリックリンクではなくディレクトリとして存在する場合は、置き換えずにユーザーに報告し、扱いを確認する。

## 2. p-chan/skills のスキルを導入する

`gh skill install p-chan/skills | cat` で一覧を取得し（パイプを通すと、対話的な選択ではなく一覧の出力になる）、ユーザーに提示して、導入するスキルを確認する。

選んだスキルが `.agents/skills/` に導入されていること。

```bash
gh skill install p-chan/skills <skill> --agent universal
```

## 3. その他のスキルを導入する

ほかに導入したいスキルがあるかユーザーに確認し、あれば `.agents/skills/` に導入されていること。

```bash
gh skill install <owner>/<repo> <skill> --agent universal
```

## 完了報告

導入したスキルと、スキップした手順とその理由をユーザーに報告する。
