SHELL=/bin/bash
.SHELLFLAGS := -eu -o pipefail -c

include .env

.PHONY: test
test: 
	go list -f '{{.Dir}}/...' -m | WORKSPACE_DIR=$(shell pwd) xargs go test -cover -v

.PHONY: lint
lint: 
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	golangci-lint run

# Lintの自動修正
.PHONY: fix
fix:
	golangci-lint run --fix

# 脆弱性診断
.PHONY: vuln
vuln:
	go install golang.org/x/vuln/cmd/govulncheck@latest
	go list -f '{{.Dir}}/...' -m | xargs govulncheck

.PHONY: install
install:
	go mod tidy

.PHONY: build
build:
	go list -f '{{.Dir}}/...' -m | xargs go build -v

.PHONY: run
run:
	cd cmd/api; go run .

.PHONY: update
update:
	go get -u ./...

# テストカバレッジ出力
.PHONY: cov
cov:
	go test -cover ./... -coverprofile=coverage.out
	go tool cover -html=coverage.out -o coverage.html

# action用のtest
.PHONY: ci-test
ci-test:
	go list -f '{{.Dir}}/...' -m | xargs go test -v -race -coverprofile=coverage.out -covermode=atomic

# GoDoc
.PHONY: doc
doc:
	go install golang.org/x/tools/cmd/godoc@latest
	godoc -http=:$(GODOC_PORT)

# codecovのymlが有効かどうかチェックする
.PHONY: codecov
codecov:
	curl --data-binary @codecov.yml https://codecov.io/validate