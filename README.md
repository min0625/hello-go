# hello-go

A simple Hello World program written in Go, with Docker containerization support.

## Requirements

- [mise](https://mise.jdx.dev/) — manages Go, golangci-lint, and Node.js versions
- Docker — for container build and run

## Getting Started

```bash
# Install toolchain
mise install

# Download Go dependencies
go mod download
```

## Usage

Run directly:

```bash
go run .
# Output: Hello, Go!
```

Run via Docker:

```bash
make docker-build
make docker-run
```

## Development

| Command        | Description                         |
| -------------- | ----------------------------------- |
| `make fix`     | Auto-fix lint issues                |
| `make lint`    | Run lint checks                     |
| `make test`    | Run all tests with race detection   |
| `make check`   | Run lint + test                     |

## Docker

The image uses a multi-stage build with a `gcr.io/distroless/static-debian12` base for a minimal, secure runtime.

```bash
# Build image (IMAGE and TAG are customizable)
make docker-build IMAGE=hello-go TAG=latest

# Run container
make docker-run
```

## License

[LICENSE](LICENSE)
