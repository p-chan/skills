---
name: setup-repo
description: リポジトリを初期セットアップする。基本ファイルの作成、p-chan/skills のスキル導入、initial commit、GitHub リポジトリの作成と設定、main のルールセット設定を行う。新しいリポジトリを作るときに使う。
---

# リポジトリのセットアップ

コミットのないリポジトリを対象とする。コミットがある場合は、対象外であることをユーザーに伝えて終える。

GitHub に空のリポジトリを作成済みの場合や、ローカルで `git init` 済みの場合など、完了条件をすでに満たしている手順はスキップする。

## 1. 方針を決める

次の項目が決まっていること。現状から決まらない項目だけをユーザーに確認する。

- オーナーとリポジトリ名
- 公開範囲（public / private）
- 説明文
- 許可するマージ方式（squash / merge commit / rebase）
- 導入する p-chan/skills のスキル

スキルは `gh skill install p-chan/skills | cat` で一覧を取得し、`setup-repo` 以外を提示する。`agent-facing-docs`、`pr`、`adr` を推奨とする。

## 2. 基本ファイルを作る

次のファイルが存在すること。既存のファイルはそのまま使う。

| ファイル    | 内容                                                                          |
| ----------- | ----------------------------------------------------------------------------- |
| `README.md` | リポジトリ名の見出しと説明文                                                  |
| `LICENSE`   | public の場合だけ作る。指定がなければ MIT、著作権者は `git config user.name` |

## 3. スキルを導入する

選んだスキルが `.agents/skills/` にあり、`.claude/skills` が `../.agents/skills` へのシンボリックリンクであること。

```bash
gh skill install p-chan/skills <skill> --agent codex
mkdir -p .claude && ln -s ../.agents/skills .claude/skills
```

`--agent codex` で `.agents/skills/` に導入し、Claude Code とはシンボリックリンクで共有する。`--agent claude-code` でも導入すると、同じスキルが `.claude/skills/` に複製される。

## 4. コミットする

手順 2〜3 の変更が、`main` ブランチに `chore: initial commit` としてコミットされていること。

## 5. GitHub リポジトリを設定する

GitHub にリポジトリが存在し、コミットが push されていて、次の設定になっていること。

- デフォルトブランチが `main`
- 公開範囲と説明文が手順 1 で決めたとおり
- 手順 1 で決めたマージ方式だけが許可されている
- マージ後のブランチ自動削除が有効

## 6. main のルールセットを作る

デフォルトブランチ（`~DEFAULT_BRANCH`）を対象とする、次のルールを持つルールセットが有効であること。

- 削除の禁止（`deletion`）
- force push の禁止（`non_fast_forward`）
- PR 必須、承認数 0（`pull_request`）。`allowed_merge_methods` は手順 1 で決めたマージ方式に揃える

ルールセットは、initial commit を push してから作る。先に作ると、PR 必須のルールによって initial commit を push できなくなる。

GitHub Free の private リポジトリはルールセットに対応していないので、作成に失敗したら、この手順はスキップする。

## 完了報告

作成・変更した内容と、スキップした手順とその理由をユーザーに報告する。
