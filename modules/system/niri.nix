# Allow use of niri from nixpkgs in ubuntu session launcher
# and fix xwayland-satellite issues on the way
{
  pkgs,
  perSystem,
  ...
}:
let
  inherit (pkgs) lib;
  niri = perSystem.self.niri-session-xwayland-satellite-auth;
  niriDesktop = pkgs.writeText "niri.desktop" ''
    sed "s|Exec=niri-session|Exec=${lib.getExe niri}|" \
      ${niri}/share/wayland-sessions/niri.desktop > $out
  '';
in
{
  environment.systemPackages = [
    niri
  ];

  systemd.services.install-niri-desktop = {
    wantedBy = [ "system-manager.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${lib.getExe' pkgs.coreutils "ln"} -sf ${niriDesktop} /usr/share/wayland-sessions/niri.desktop";
    };
  };
}
