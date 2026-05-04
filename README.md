# hello-go

A simple Hello World program written in Go, with Docker containerization support.

## Requirements

### Prerequisites
- **Go** 1.26.2
- **golangci-lint** 2.11.2
- **Docker** — for building and running containers

### Version Management
This project uses [mise](https://mise.jdx.dev/) to manage tool versions consistently across environments. See [`mise.toml`](mise.toml) for exact versions.

### Development Container (Recommended)
The easiest way to get started is using a development container which includes all dependencies:
- VS Code with [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- Docker

Open the workspace in Dev Containers and all dependencies will be automatically installed.

## Getting Started

### Option 1: Local Setup

1. **Install mise** (if not already installed):
   ```bash
   curl https://mise.jdx.dev/install.sh | sh
   ```

2. **Install tools managed by mise**:
   ```bash
   mise install
   ```

3. **Download Go dependencies**:
   ```bash
   go mod download
   ```

4. **Run the program**:
   ```bash
   go run .
   # Output: Hello, Go!
   ```

### Option 2: Development Container

1. Open the workspace in VS Code's Dev Containers
2. The tools will be automatically installed via `mise`
3. Run the program:
   ```bash
   go run .
   ```

### Option 3: Docker Container

Build and run the application in Docker:

```bash
# Build the image
make docker-build

# Run the container
make docker-run
# Output: Hello, Go!
```

You can customize the image name and tag:
```bash
make docker-build IMAGE=my-app TAG=v1.0
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
