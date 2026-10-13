{
  perSystem,
  pkgs,
  ...
}:
let
  inherit (pkgs) lib;
  system-manager = perSystem.system-manager.default;
in
pkgs.stdenvNoCC.mkDerivation {
  inherit (system-manager) name meta;
  dontUnpack = true;
  nativeBuildInputs = [ pkgs.makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    makeWrapper ${lib.getExe system-manager} $out/bin/system-manager \
      --add-flags "switch --sudo --flake path:/home/arnaud/devel/laas/pi2/homes"
  '';
}
