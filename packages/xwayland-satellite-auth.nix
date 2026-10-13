# TODO: it is still unclear whose responsibility it is to create this cookie
{
  pkgs,
  ...
}:
pkgs.writeShellApplication {
  name = "xwayland-satellite";
  runtimeInputs = with pkgs; [
    xauth
    gnugrep
    xxd
    xwayland-satellite
  ];
  text = ''
    export XAUTHORITY="$HOME/.Xauthority"

    xauth list | grep -q ':0  MIT-MAGIC-COOKIE-1' || xauth add :0 . "$(xxd -l 16 -p /dev/urandom)"

    exec xwayland-satellite "$@" -auth "$XAUTHORITY"
  '';
}
