---
name: setup-skills
description: リポジトリにスキルの置き場所を作る。`.agents/skills` や `.claude/skills` が無いリポジトリにスキルを導入するときに使う。
---

# スキルの置き場所の準備

`.agents/skills/` ディレクトリがあり、`.claude/skills` が `../.agents/skills` へのシンボリックリンクであること。

```bash
mkdir -p .agents/skills .claude
[ -e .claude/skills ] || ln -s ../.agents/skills .claude/skills
```

スキルはエージェント間で共通の置き場所である `.agents/skills/` に集約し、Claude Code とはシンボリックリンクで共有する。そのため、スキルを導入するときは `gh skill install` に、`.agents/skills/` を導入先にする `--agent universal` を付ける。

`.claude/skills` がディレクトリや別の場所へのリンクとしてすでに存在する場合は、置き換えずにユーザーに報告し、扱いを確認する。
