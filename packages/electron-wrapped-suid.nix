# ref. https://github.com/NixOS/nixpkgs/pull/560945
{
  pkgs,
  ...
}:
let
  inherit (pkgs) lib;
  electron = pkgs.electron_42;
  sandboxExecutableName = "__electron_${lib.versions.major electron.version}-suid-sandbox";
in
pkgs.stdenvNoCC.mkDerivation {
  name = "electron-wrapped-suid";
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/bin
    sed "s|export CHROME_DEVEL_SANDBOX='.*'|export CHROME_DEVEL_SANDBOX='/run/wrappers/bin/${sandboxExecutableName}'|" \
      ${lib.getExe electron} > $out/bin/electron
    chmod +x $out/bin/electron
  '';
  passthru = { inherit electron sandboxExecutableName; };
  meta.mainProgram = "electron";
}
