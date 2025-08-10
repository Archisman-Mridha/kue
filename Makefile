.PHONY: format
format:
	@golangci-lint fmt

.PHONY: lint
lint:
	@golangci-lint run ./...

.PHONY: build
build:
	@go build -o build/kue ./cmd

.PHONY: nix-build
nix-build:
	@nix build --out-link build/nix

.PHONY: addlicense
addlicense:
	@find . -name '*.go' -exec addlicense -f "LICENSE" {} +
