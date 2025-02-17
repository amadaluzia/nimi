{
  writeShellApplication,
  nim-2_0,
  alejandra,
  statix,
  deadnix,
}:
writeShellApplication {
  name = "linter";
  runtimeInputs = [
    nim-2_0
    alejandra
    statix
    deadnix
  ];
  text = ''
    find . -name "*.nim" -exec nimpretty --indent:2 {} +
    find . -name "*.nix" -exec alejandra {} +
    find . -name "*.nix" -exec deadnix -e {} +
    find . -name "*.nix" -exec statix fix {} ';'
  '';
}
