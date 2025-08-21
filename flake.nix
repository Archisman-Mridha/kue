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

            pre-commit
            addlicense
            bun
            nix-update
          ];

          buildInputs = [
            cue
            timoni
          ];
        };

        CGO_ENABLED = 0;

        packages.default = buildGoModule {
          pname = "kue";
          version = "v" + builtins.readFile ./cmd/kue/version/version.txt;

          meta = {
            mainProgram = "kue";

            description = "Kue : Manage your Kubernetes cluster configuration using CueLang 🗿";
            homepage = "https://github.com/Archisman-Mridha/kue";
            license = lib.licenses.bsd2;

            maintainers =
              with lib.maintainers
              // {
                archisman-mridha = {
                  name = "Archisman Mridha";
                  email = "archisman@obmondo.com";
                };
              }; [ archisman-mridha ];
          };

          vendorHash = "sha256-GTfqam2tPGCuInZNRtXXODSkWa7r84fIU0T3kKfqR2U=";

          src = self;
          subPackages = [ "cmd/kue" ];
          goSum = ./go.sum;
          ldflags = [
            # Disable symbol table generation.
            # You will not be able to use go tool nm to list the symbols in the binary.
            "-s"

            # Disable DWARF debugging information generation.
            # You will not be able to use gdb on the binary to look at specific functions or set
            # breakpoints or get stack traces, because all the metadata gdb needs will not be
            # there. You will also not be able to use other tools that depend on the information,
            # like pprof profiling.
            "-w"
          ];
        };
      }
    );
}
