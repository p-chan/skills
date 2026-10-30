---
name: screenshot
description: playwright-cli で開いているページのスクリーンショットを、デバイスピクセル比を指定して撮る。playwright-cli で高解像度のスクリーンショットを撮るときに使う。
---

# screenshot

playwright-cli で開いているページを撮るときは、`playwright-cli screenshot` の代わりに `scripts/screenshot.sh` を使う。

```sh
scripts/screenshot.sh [-s=<session>] [--scale <n>] [--full-page] [--filename <path>]
```

`--scale` にはデバイスピクセル比を指定する。デフォルトは `1`。

| 撮りたいもの | `--scale` |
| --- | --- |
| 動作確認や、エージェントが内容を読むためのスクリーンショット | `1` |
| 細部の見た目を確認する、または人に見せるためのスクリーンショット | `2` |

`--scale` が `2` 以上の画像はピクセル数が増え、読み込むとトークンを多く消費する。

## `--scale` の制約

ブラウザのコンテキストのデバイスピクセル比は作成後に変えられない。そのため、`--scale` が `2` 以上のときは、指定したデバイスピクセル比の一時的なコンテキストで現在の URL を開き直して撮る。

Cookie と localStorage は引き継ぐが、入力中のフォームや開いたモーダルなどのページ上の状態は引き継がない。操作後の状態を撮る場合は `--scale 1` で撮る。
