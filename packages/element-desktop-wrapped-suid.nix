{
  perSystem,
  pkgs,
  ...
}:
let
  inherit (pkgs) lib;
  electron = perSystem.self.electron-wrapped-suid;
in
pkgs.stdenvNoCC.mkDerivation {
  name = "element-desktop-wrapped-suid";
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    sed 's|exec "/nix/store/.*/bin/electron"|exec "${lib.getExe electron}"|' \
      ${lib.getExe pkgs.element-desktop} > $out/bin/element-desktop
    chmod +x $out/bin/element-desktop
  '';
  passthru = { inherit electron; };
  meta.mainProgram = "element-desktop";
}
