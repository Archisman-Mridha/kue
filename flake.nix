{
  description = "Kue development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      with pkgs;
      {
        devShells.default = mkShell {
          nativeBuildInputs = [
            go
            golangci-lint

            addlicense
            pre-commit
          ];

          buildInputs = [
            timoni
          ];
        };

        packages.default = buildGoModule {
          pname = "kue";
          version = "v0.0.1";

          vendorHash = "sha256-erbiH2agUTD0Z30xcVSFcDHzkRvkRXOQ3lb887bcVrs%3D";

          src = ./.;
          subPackages = [ ./cmd ];

          CGO_ENABLED = 0;
          ldflags = [
            "-s"
            "-w"
          ];
        };
      }
    );
}
