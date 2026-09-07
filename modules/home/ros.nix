# Provide vcs executable
# and shell completion for colcon, ros2 and vcs.
# If you want this also for zsh, that's easy, just ask.
{
  lib,
  pkgs,
  ...
}:
{
  home = {
    packages = [
      pkgs.python3Packages.argcomplete
      pkgs.vcs2l
    ];
  };

  programs = {
    bash.initExtra = ''
      eval "$(register-python-argcomplete colcon ros2)"
    '';

    fish.completions = lib.genAttrs [ "colcon" "ros2" ] (
      name: "register-python-argcomplete --shell fish ${name}"
    );
  };
}
