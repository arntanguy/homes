{
  perSystem,
  pkgs,
  ...
}:
let
  inherit (pkgs) lib;
  electron = perSystem.self.electron-wrapped-suid;
  rstudio = pkgs.rstudio.overrideAttrs (super: {
    postPatch = super.postPatch + ''
      substituteInPlace src/cpp/CMakeLists.txt \
        --replace-fail 'C++17' 'C++20' \
        --replace-fail 'c++17' 'c++20'
      substituteInPlace cmake/compiler.cmake \
        --replace-fail 'CMAKE_CXX_STANDARD 17' 'CMAKE_CXX_STANDARD 20'
    '';
  });
in
pkgs.stdenvNoCC.mkDerivation {
  name = "rstudio-wrapped-suid";
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin $out/share/applications $out/share/icons/hicolor/256x256/apps
    sed 's|exec "/nix/store/.*/bin/electron"|exec "${lib.getExe electron}"|' \
      ${lib.getExe rstudio} \
      > $out/bin/rstudio
    sed "s|Exec=rstudio|Exec=$out/bin/rstudio|" \
      ${rstudio}/share/applications/rstudio.desktop \
      > $out/share/applications/rstudio.desktop
    cp \
      ${rstudio}/share/icons/hicolor/256x256/apps/rstudio.png \
      $out/share/icons/hicolor/256x256/apps
    chmod +x $out/bin/rstudio
  '';
  passthru = { inherit electron; };
  meta.mainProgram = "rstudio";
}
