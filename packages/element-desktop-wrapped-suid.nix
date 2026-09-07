# ref. https://github.com/NixOS/nixpkgs/pull/560945
{
  pkgs,
  ...
}:
let
  inherit (pkgs) lib;
  electron = pkgs.electron_42;
  sandboxExecutableName = "__electron_${lib.versions.major electron.version}-suid-sandbox";
  electron-wrapped-suid = pkgs.stdenvNoCC.mkDerivation {
    name = "electron-wrapped-suid";
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out/bin
      sed "s|export CHROME_DEVEL_SANDBOX='.*'|export CHROME_DEVEL_SANDBOX='/run/wrappers/bin/${sandboxExecutableName}'|" \
        ${lib.getExe electron} > $out/bin/electron
      chmod +x $out/bin/electron
    '';
    meta.mainProgram = "electron";
  };
in
pkgs.stdenvNoCC.mkDerivation {
  name = "element-desktop-wrapped-suid";
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    sed 's|exec "/nix/store/.*/bin/electron"|exec "${lib.getExe electron-wrapped-suid}"|' \
      ${lib.getExe pkgs.element-desktop} > $out/bin/element-desktop
    chmod +x $out/bin/element-desktop
  '';
  meta.mainProgram = "element-desktop";
  passthru = { inherit electron sandboxExecutableName; };
}
