# Needed for shell expansion
SHELL = /bin/bash

VERSION := $(shell git describe --tags --always --dirty 2>/dev/null || echo dev)
COMMIT := $(shell git rev-parse --short HEAD 2>/dev/null || echo unknown)
BUILD_DATE := $(shell date -u +%Y-%m-%dT%H:%M:%SZ)

.PHONY: format
format:
	@golangci-lint fmt

.PHONY: lint
lint:
	@golangci-lint run ./...

.PHONY: build
build:
	@go build -ldflags="$(LDFLAGS)" -o build/kue ./cmd/kue

.PHONY: nix-build
nix-build:
	@nix build --out-link build/nix

.PHONY: addlicense
addlicense:
	@find . -name '*.go' -exec addlicense -f "LICENSE" {} +
