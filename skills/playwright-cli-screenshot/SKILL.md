---
name: playwright-cli-screenshot
description: playwright-cli で高解像度のスクリーンショットを撮る。playwright-cli で人に見せるスクリーンショットを撮るときに使う。
---

# playwright-cli-screenshot

人に見せるスクリーンショットは、デバイスピクセル比 2 のセッションで `--hires` を付けて撮る。playwright-cli のデフォルトのデバイスピクセル比は 1 で、`--hires` を付けても 1x の画像になる。デバイスピクセル比はセッションを開くときにしか指定できない。

## セッションを用意する

現在のセッションのデバイスピクセル比を確認する。

```sh
playwright-cli eval "devicePixelRatio"
```

`2` でなければ、デバイスピクセル比が 2 のデバイスプリセットを指定して開き直す。開き直すと入力中のフォームなどのページ上の状態は失われる。Cookie と localStorage は、開き直す前に `state-save` で保存し、開き直したあとに `state-load` で復元してから再読み込みする。保存したファイルには Cookie が含まれるため、復元したら削除する。

```sh
playwright-cli state-save state.json
playwright-cli close
playwright-cli open --device "Desktop Chrome HiDPI" <url>
playwright-cli state-load state.json
playwright-cli reload
```

このプリセットでは、ビューポートが 1280×720 になり、ユーザーエージェントが Windows 版 Chrome のものに固定される。ビューポートやユーザーエージェントで表示が変わるページは、元のセッションと異なる表示になる可能性がある。

人に見せるスクリーンショットを撮ると最初から分かっているときは、はじめからこのプリセットで開く。

## 撮る

```sh
playwright-cli screenshot --hires
```

デバイスピクセル比 2 のセッションでも、`--hires` を付けないと 1x で保存される。`--hires` の画像はピクセル数が 4 倍になり、読み込むとトークンを多く消費するため、エージェントが内容を読むためのスクリーンショットは `--hires` を付けずに撮る。
