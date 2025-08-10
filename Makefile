.PHONY: format
format:
	@golangci-lint fmt

.PHONY: lint
lint:
	@golangci-lint run ./...

.PHONY: build
build:
	@go build -o build/kue ./cmd

.PHONY: addlicense
addlicense:
	@find . -name '*.go' -exec addlicense -f "LICENSE" {} +
