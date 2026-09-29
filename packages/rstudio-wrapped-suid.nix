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
  name = "rstudio-wrapped-suid";
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin $out/share/applications $out/share/icons/hicolor/256x256/apps
    sed 's|exec "/nix/store/.*/bin/electron"|exec "${lib.getExe electron}"|' \
      ${lib.getExe pkgs.rstudio} \
      > $out/bin/rstudio
    sed "s|Exec=rstudio|Exec=$out/bin/rstudio|" \
      ${pkgs.rstudio}/share/applications/rstudio.desktop \
      > $out/share/applications/rstudio.desktop
    cp \
      ${pkgs.rstudio}/share/icons/hicolor/256x256/apps/rstudio.png \
      $out/share/icons/hicolor/256x256/apps
    chmod +x $out/bin/rstudio
  '';
  meta.mainProgram = "rstudio";
  passthru = {
    inherit electron;
    inherit (electron) sandboxExecutableName;
  };
}
