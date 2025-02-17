{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    systems = ["x86_64-linux" "aarch64-linux"];
    forAllSystems = f:
      nixpkgs.lib.genAttrs systems (
        system: f system nixpkgs.legacyPackages.${system}
      );
  in {
    packages = forAllSystems (system: pkgs: {
      default = pkgs.callPackage ./flake/package.nix {};
      nimi = self.packages.${system}.default;
    });

    devShells = forAllSystems (_: pkgs: {
      default = pkgs.callPackage ./flake/shell.nix {};
    });

    formatter =
      forAllSystems (_: pkgs:
        pkgs.callPackage ./flake/formatter.nix {});
  };
}
