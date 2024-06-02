# test を実行
.PHONY: test
test: 
	go list -f '{{.Dir}}/...' -m | WORKSPACE_DIR=$(shell pwd) xargs go test -cover -v

.PHONY: lint
lint: 
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	go install mvdan.cc/unparam@latest
	go list -f '{{.Dir}}/...' -m | xargs golangci-lint run
	go list -f '{{.Dir}}/...' -m | xargs unparam -exported

# 脆弱性診断を実行
.PHONY: vulncheck
vulncheck:
	go install golang.org/x/vuln/cmd/govulncheck@latest
	go list -m -f '{{.Dir}}' | xargs -I {} govulncheck -C {} ./...

.PHONY: install
install:
	go mod tidy

.PHONY: build
build:
	go list -f '{{.Dir}}' -m | xargs -I {} go build -v {}