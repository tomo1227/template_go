# template_golang

Go の api の Template ブランチ

# Usage

このテンプレートをcloneしたら以下を自分の環境に合わせて編集しましょう。

- [Contribution guidelines for this project](.devcontainer/.env)
- [devcontainer.json](.devcontainer/devcontainer.json)
- [compose.yml](.devcontainer/compose.yml)
- [pr_test.yml](.github/workflows/pr_test.yml)
- [pull_request_template](.github/pull_request_template.md)
- [go.mod](cmd/api/go.mod)
- [.env](.env)

## PORTの割り当て

[.env](.env)でホストIPを変更すれば、他プロジェクトとポートが被っても使用できる。

> [!IMPORTANT]
> .envのHOST_IPに127.0.0.1以外のホストIP(ループバックアドレス)を指定するとき
> 以下のコマンドをターミナルで事前に叩いておく必要がある。(127.0.0.2の箇所にHOST IPを指定)
>
> ```txt
> sudo ifconfig lo0 alias 127.0.0.2
> ```
