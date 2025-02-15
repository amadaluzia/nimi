{
  mkShell,
  alejandra,
  deadnix,
  statix,
  nim-2_0,
  nimble,
}:
mkShell {
  name = "nimi";
  packages = [
    alejandra
    deadnix
    statix
    nim-2_0
    nimble
  ];
}
