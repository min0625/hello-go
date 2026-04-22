# AGENTS.md

## Project Overview

`hello-go` 是一個使用 Go 撰寫的簡單 Hello World 程式，並包含 Docker 容器化支援。

- **語言**: Go 1.26.2
- **Lint 工具**: golangci-lint 2.11.2
- **版本管理**: mise
- **容器**: Docker（multi-stage build，使用 distroless base image）

## Setup Commands

- 安裝工具鏈（需先安裝 [mise](https://mise.jdx.dev/)）：`mise install`
- 下載 Go 依賴：`go mod download`

## Development Workflow

- 自動修正 lint 問題：`make fix`
- 執行 lint 檢查：`make lint`
- 執行測試：`make test`
- 執行 lint + test：`make check`

## Testing Instructions

- 執行所有測試：`make test`（等同於 `go test -v -race -failfast ./...`）
- 提交前務必通過 `make check`

## Code Style

- 使用 `golangci-lint` 進行 lint 與格式化，設定檔位於 repo 根目錄
- 使用 `make fmt` 格式化程式碼（呼叫 `golangci-lint fmt`）
- 遵循標準 Go 命名慣例

## Build and Deployment

- 建置 Docker image：`make docker-build`（預設 `IMAGE=hello-go`、`TAG=latest`）
- 執行 Docker container：`make docker-run`
- 手動建置二進位：`CGO_ENABLED=0 GOOS=linux go build -trimpath -ldflags="-s -w" -o hello-go .`

## Pull Request Guidelines

- 提交前執行 `make check` 確保 lint 與測試全數通過
- commit message 使用簡短英文描述

## Additional Notes

- Docker image 採用 multi-stage build，最終 image 基於 `gcr.io/distroless/static-debian12`，無 shell
- `mise.toml` 管理 Go、golangci-lint、Node.js 版本，確保開發環境一致
