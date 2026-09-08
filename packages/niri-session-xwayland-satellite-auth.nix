{
  perSystem,
  pkgs,
  ...
}:
let
  inherit (pkgs) lib;
in
pkgs.writeShellApplication {
  name = "niri-session-xwayland-satellite-auth";
  text = ''
    if [ -d ~/.nix-profile/bin ]; then
      export PATH=~/.nix-profile/bin:$PATH
    fi
    export PATH=${lib.getBin perSystem.self.xwayland-satellite-auth}/bin:$PATH
    exec ${lib.getExe' pkgs.niri "niri-session"}
  '';
}
