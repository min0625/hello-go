IMAGE ?= hello-go
TAG ?= latest

docker-build:
	docker build -t $(IMAGE):$(TAG) .

docker-run:
	docker run --rm $(IMAGE):$(TAG)

fmt:
	golangci-lint fmt -v ./...

fix:
	golangci-lint run -v --fix ./...

lint:
	golangci-lint run -v ./...

test:
	go test -v -race -failfast ./...

check: lint test
