---
name: ios-simulator
description: xcodebuild や simctl で、iOS シミュレーターを使ってアプリのビルド、テスト、起動、スクリーンショットや動画の撮影をするときに使う。
---

# iOS シミュレーター

## 端末

端末ごとにアプリやテストのデータが数 GB たまるので、使う端末を絞る。

### 既定の端末

既定では、最新の無印 iPhone と最新の無印 iPad だけを使う。

`xcrun simctl list devicetypes` は新しい機種から順に並ぶので、次の条件に最初に一致する機種を使う。

- iPhone: `iPhone <数字>` だけの名前の機種。Pro、Plus、Max、Air、e、mini などが付く機種は除く
- iPad: `iPad (<チップ名>)` の名前の機種。Pro、Air、mini が付く機種は除く

iPad の動作確認が求められていないときは、iPhone だけを使う。

既定の端末がないときは、`xcrun simctl create` で作る。

### 特定の端末

ユーザーに指示されたときや、特定の画面サイズや機種でしか起きない不具合を確かめるときなど、特定の端末を使う理由があるときは、既定以外の端末を使ってよい。

使い終わったら、端末をシャットダウンし、データを元に戻す。

- 既存の端末: `xcrun simctl erase <UDID>` で初期化する
- 作成した端末: `xcrun simctl delete <UDID>` で削除する

