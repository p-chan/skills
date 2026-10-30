---
name: conventional-commits
description: Conventional Commits の type を選ぶ。コミットメッセージや PR タイトルなどを Conventional Commits の形式で書くときに使う。
---

# Conventional Commits

## type の選び方

次の順に確認し、最初に当てはまる type を使う。ユーザーとは、アプリケーションではそのアプリを使う人、ライブラリではそのライブラリを使う開発者を指す。

1. 以前のコミットの取り消し → `revert`
2. ユーザーが観測できる変更
   1. 動作を変えず、性能だけを改善する → `perf`
   2. ユーザーが遭遇していた不具合を修正する → `fix`
   3. それ以外 → `feat`
3. ユーザーが観測できない変更は、主な変更内容で選ぶ
   - ドキュメント → `docs`
   - フォーマットなど、コードの意味を変えないスタイルの変更 → `style`
   - 機能追加や不具合修正を伴わないリファクタリング → `refactor`
   - テストの追加・更新 → `test`
   - ビルドシステムや依存関係 → `build`
   - CI 設定 → `ci`
   - それ以外 → `chore`
