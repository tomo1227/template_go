#!/usr/bin/env sh

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
echo "source ~/.git-completion.bash" >> ~/.bashrc

# bash auto completion
sudo apt update && sudo apt install bash-completion

echo "pip Installing"
pip install --upgrade aws-sam-cli
sam --version

# localstack
# see: https://qiita.com/Brutus/items/89eb03be7c7bd9d6911d
echo "localstack Installing"
pip install localstack
localstack --version

echo "awscli-local Installing"
pip install awscli-local
awslocal --version

echo "air Installing"
go install github.com/cosmtrek/air@latest

go mod tidy
cd cmd/api
go mod tidy
