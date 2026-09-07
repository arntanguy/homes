# TODO: it is still unclear whose responsibility it is to create this cookie
{
  pkgs,
  ...
}:
let
  inherit (pkgs) lib;
in
pkgs.writeShellApplication {
  name = "xwayland-satellite";
  text = ''
    export XAUTHORITY="$HOME/.Xauthority"

    xauth list | grep -q ':0  MIT-MAGIC-COOKIE-1' || xauth add :0 . "$(${lib.getExe pkgs.xxd} -l 16 -p /dev/urandom)"

    exec ${lib.getExe pkgs.xwayland-satellite} "$@" -auth "$XAUTHORITY"
  '';
}
