# template_go

 [![CI](https://github.com/tomo1227/template_go/actions/workflows/ci.yml/badge.svg)](https://github.com/tomo1227/template_go/actions/workflows/ci.yml) [![CodeQL](https://github.com/tomo1227/template_go/actions/workflows/code_ql.yml/badge.svg)](https://github.com/tomo1227/template_go/actions/workflows/code_ql.yml) [![codecov](https://codecov.io/github/tomo1227/template_go/graph/badge.svg?token=9W57OUKPMU)](https://codecov.io/github/tomo1227/template_go)  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Go の API の Template ブランチ

# Usage

このテンプレートをcloneしたら以下を自分の環境に合わせて編集しましょう。

- [Contribution guidelines for this project](.devcontainer/.env)
- [devcontainer.json](.devcontainer/devcontainer.json)
- [compose.yml](.devcontainer/compose.yml)
- [pr_test.yml](.github/workflows/pr_test.yml)
- [pull_request_template](.github/pull_request_template.md)
- [go.mod](cmd/api/go.mod)
- [.env](.env)
- [README.md](README.md)

Codecovを使用しているため、[Codec GitHub app](https://github.com/apps/codecov) で自分のリポジトリにinstallする。Codecにログインして、secretsに `CODECOV_TOKEN` を登録する。

## APIサーバーの起動

以下のコマンドでサンプルのサーバーを起動できる。

```sh
make run
```

```shell_session
$ curl localhost:8080/health
{"status":"OK!"}
```

## Go Doc

```sh
make doc
```

## PORTの割り当て

[.env](.env)でホストIPを変更すれば、他プロジェクトとポートが被っても使用できる。

> [!IMPORTANT]
> .envのHOST_IPに127.0.0.1以外のホストIP(ループバックアドレス)を指定するとき
> 以下のコマンドをターミナルで事前に叩いておく必要がある。(127.0.0.2の箇所にHOST IPを指定)
>
> ```txt
> sudo ifconfig lo0 alias 127.0.0.2
> ```

## Merge

main にマージするときは`squash and merge`すること

## Commit Template の設定

```bash
git config --global commit.template .commit.template
```

## Commit Message ガイドライン

.commit template を参考に記述してください

## Pull Request ガイドライン

`[emoji][type]: (title)`

- ✨feat: ログイン機能を追加
- 👓fix(a11y): ナビゲーションのアクセシビリティを改善

### Pull Request Type

- fix: 🐛 バグの修正 (SemVer パッチと関連)
- feat: ✨ 新機能を追加 (SemVer のマイナーに対応)
- feat!: 💥 破壊的な新機能 (SemVer のメジャーになります)
- fix!: 💥 破壊的なバグ修正 (SemVer のメジャーになります)
- refactor: ♻️ コードの再構築
- revert: ⏪ 変更を取り消す
- test: 🧪 テストに関連する変更
- docs: 📚 ドキュメンテーションの変更
- style: 🎨 スタイルや書式の変更
- perf: ⚡ パフォーマンス改善
- build: 👷‍♀️ ビルドシステムや外部依存関係の変更
- chore: 🔧 その他の変更
- ci: 🎡 CI/CD パイプラインに関連する変更
