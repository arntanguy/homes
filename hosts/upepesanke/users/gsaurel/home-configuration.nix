{
  flake,
  perSystem,
  pkgs,
  ...
}:
{
  imports = [ "${flake}/users/gsaurel/home-configuration.nix" ];

  home.packages = [
    pkgs.rofimoji
    pkgs.rofi-rbw
  ];

  wayland.windowManager.niri = {
    enable = true;
    package = perSystem.self.niri-session-xwayland-satellite-auth;
    settings = {
      binds = {
        "Mod+T" = {
          spawn = [ "kitty" ];
        };
        "Mod+D" = {
          spawn = [
            "rofi"
            "-show"
            "run"
          ];
        };
        "Mod+I" = {
          spawn = [ "rofi-rbw" ];
        };
        "Mod+M" = {
          spawn = [ "rofimoji" ];
        };
        "Super+Alt+S" = {
          _props.allow-when-locked = true;
          spawn = [
            "systemctl"
            "suspend"
          ];
        };
        "Super+Alt+L" = {
          _props.allow-when-locked = true;
          spawn = [ "swaylock" ];
        };
        "XF86AudioRaiseVolume" = {
          _props.allow-when-locked = true;
          spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "0.05+"
          ];
        };
        "XF86AudioLowerVolume" = {
          _props.allow-when-locked = true;
          spawn = [
            "wpctl"
            "set-volume"
            "@DEFAULT_AUDIO_SINK@"
            "0.05-"
          ];
        };
        "XF86AudioMicMute" = {
          _props.allow-when-locked = true;
          spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SOURCE@"
            "toggle"
          ];
        };
        "XF86AudioMute" = {
          _props.allow-when-locked = true;
          spawn = [
            "wpctl"
            "set-mute"
            "@DEFAULT_AUDIO_SINK@"
            "toggle"
          ];
        };
      };
    };
  };
}
