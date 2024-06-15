# test を実行
.PHONY: test
test: 
	go list -f '{{.Dir}}/...' -m | WORKSPACE_DIR=$(shell pwd) xargs go test -cover -v

# action用のtest
.PHONY: ci-test
ci-test:
	go list -f '{{.Dir}}/...' -m | WORKSPACE_DIR=$(shell pwd) xargs go test -v -covermode=count -coverprofile=coverage.out

.PHONY: lint
lint: 
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	go install mvdan.cc/unparam@latest
	golangci-lint run
	unparam -exported ./...

# 脆弱性診断を実行
.PHONY: vulncheck
vulncheck:
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
	go run cmd/api/main.go

.PHONY: godoc
godoc:
	go doc fmt

.PHONY: update
update:
	go get -u ./...

# テストカバレッジ出力(html)
.PHONY: cov
cov:
	go test -cover ./... -coverprofile=coverage.out
	go tool cover -html=coverage.out -o coverage.html
