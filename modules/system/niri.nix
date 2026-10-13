# Allow use of niri from nixpkgs in ubuntu session launcher
# and fix xwayland-satellite issues on the way
{
  pkgs,
  perSystem,
  ...
}:
let
  inherit (pkgs) lib;
  niri' = perSystem.self.niri-session-xwayland-satellite-auth;
  # Generate the desktop file contents with the substituted Exec path
  niriDesktop = pkgs.writeText "niri.desktop" ''
    [Desktop Entry]
    Name=Niri
    Comment=A scrollable-tiling Wayland compositor
    Exec=${lib.getExe niri'}
    Type=Application
    DesktopNames=niri
  '';

  installNiriDesktop = pkgs.writeShellScript "install-niri-desktop" ''
    mkdir -p /usr/share/wayland-sessions
    cp ${niriDesktop} /usr/share/wayland-sessions/niri.desktop
  '';
  # installNiriDesktop = pkgs.writeShellScript "install-niri-desktop" ''
  #   ${lib.getExe pkgs.gnused} \
  #     "s|Exec=niri-session|Exec=${lib.getExe niri'}|" \
  #     "${pkgs.niri}/share/wayland-sessions/niri.desktop" \
  #      >      "/usr/share/wayland-sessions/niri.desktop"
  # '';
in
{
  environment.systemPackages = [
    niri'
  ];

  systemd.services.install-niri-desktop = {
    wantedBy = [ "system-manager.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = installNiriDesktop;
    };
  };
}
