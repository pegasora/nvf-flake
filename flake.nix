{
  description = "nvf-config flake for neovim on nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nvf.url = "github:NotAShelf/nvf";
  };

  outputs = {
    nixpkgs,
    flake-parts,
    nvf,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      # Define supported systems
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {system, ...}: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.default =
          (nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [./config];
          }).neovim;
      };
    };
}
