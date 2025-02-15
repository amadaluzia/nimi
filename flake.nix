{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    genAttrs = names: f:
      builtins.listToAttrs (map (name: {
          inherit name;
          value = f name;
        })
        names);
    systems = ["x86_64-linux"];
    pkgs = builtins.listToAttrs (map (system: {
        name = system;
        value = import nixpkgs {
          inherit system;
        };
      })
      systems);
    forAllSystems = genAttrs systems;
  in {
    packages = forAllSystems (system: {
      default = pkgs.${system}.callPackage ./flake/package.nix {};
      nimi = self.packages.${system}.default;
    });

    devShells = forAllSystems (system: {
      default = pkgs.${system}.callPackage ./flake/shell.nix {};
    });
  };
}
