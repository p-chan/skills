---
name: playwright-cli-screenshot
description: playwright-cli で高解像度のスクリーンショットを撮る。playwright-cli で人に見せるスクリーンショットを撮るときに使う。
---

# playwright-cli-screenshot

playwright-cli のデフォルトのデバイスピクセル比は 1 で、`screenshot --hires` を付けても 1x の画像になる。デバイスピクセル比はセッションを開くときにしか指定できないため、人に見せるスクリーンショットを撮る可能性があるセッションは、デバイスピクセル比が 2 のデバイスプリセットを指定して開く。

```sh
playwright-cli open --device "Desktop Chrome HiDPI" <url>
```

このプリセットでは、ビューポートが 1280×720 になり、ユーザーエージェントが Windows 版 Chrome のものに固定される。ユーザーエージェントで表示が変わるページは、実際の表示と異なる可能性がある。

デバイスピクセル比 1 で開いたセッションで人に見せるスクリーンショットが必要になったときは、このプリセットを指定して開き直す。開き直すと、入力中のフォームなどのページ上の状態は失われ、別のビューポートで確認していたページはレイアウトが変わる可能性がある。Cookie や localStorage は、開き直す前に `state-save` で保存し、開き直したあとに `state-load` で復元してからページを再読み込みする。

このセッションでも、`screenshot` は 1x の画像で保存される。人に見せるスクリーンショットを撮るときだけ `--hires` を付ける。

```sh
playwright-cli screenshot --hires
```

`--hires` の画像はピクセル数が 4 倍になり、読み込むとトークンを多く消費する。エージェントが内容を読むためのスクリーンショットは、`--hires` を付けずに撮る。
