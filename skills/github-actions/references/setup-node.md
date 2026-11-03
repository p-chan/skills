# actions/setup-node

- リポジトリに `.node-version` があるときは、`node-version-file` で読む。`node-version` は `node-version-file` より優先されるので、直書きがあれば削除する
- 複数のバージョンを意図的に試すマトリックスビルドは、`.node-version` に寄せずに維持する
