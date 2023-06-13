{
  description = "ELM with formatting, linting and test";

  # broken on Fish
  # as a workaround, use `nix develop` the first time
  # https://github.com/direnv/direnv/issues/1022
  nixConfig.extra-substituters = [
    "https://pinage404-nix-sandboxes.cachix.org"
  ];
  nixConfig.extra-trusted-public-keys = [
    "pinage404-nix-sandboxes.cachix.org-1:5zGRK2Ou+C27E7AdlYo/s4pow/w39afir+KRz9iWsZA="
  ];

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in
      {
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            nodejs_20
            nodePackages.elm-test # to shut up the language server
            yarn
          ];
          shellHook = ''
            yarn install
          '';
        };
      });
}
