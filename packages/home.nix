{
  perSystem,
  pkgs,
  ...
}:
let
  inherit (pkgs) lib;
  home-manager = perSystem.home-manager.default;
in
pkgs.stdenvNoCC.mkDerivation {
  inherit (home-manager) name meta;
  dontUnpack = true;
  nativeBuildInputs = [ pkgs.makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    makeWrapper ${lib.getExe home-manager} $out/bin/home-manager \
      --add-flags "switch -b hmback --flake git+https://gitlab.laas.fr/pi2/homes"
  '';
}
