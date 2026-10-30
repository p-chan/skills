---
name: playwright-cli-screenshot
description: playwright-cli で高解像度のスクリーンショットを撮る。playwright-cli で細部の見た目を確認するときや、人に見せるスクリーンショットを撮るときに使う。
---

# playwright-cli-screenshot

playwright-cli のデフォルトのデバイスピクセル比は 1 で、`screenshot --hires` を付けても 1x の画像になる。デバイスピクセル比はセッションを開くときにしか指定できないため、高解像度で撮る可能性があるセッションは、デバイスピクセル比が 2 のデバイスプリセットを指定して開く。

```sh
playwright-cli open --device "Desktop Chrome HiDPI" <url>
```

このプリセットでは、ユーザーエージェントが Windows 版 Chrome のものに固定される。ユーザーエージェントで表示が変わるページは、実際の表示と異なる可能性がある。

このセッションでも、`screenshot` は 1x の画像で保存される。高解像度で撮るときだけ `--hires` を付ける。

```sh
playwright-cli screenshot --hires
```

`--hires` の画像はピクセル数が 4 倍になり、読み込むとトークンを多く消費する。動作確認やエージェントが内容を読むためのスクリーンショットは、`--hires` を付けずに撮る。

デバイスピクセル比 1 で開いたセッションで高解像度の画像が必要になったときは、`--device "Desktop Chrome HiDPI"` を指定して開き直す。
