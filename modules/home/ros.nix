{
  lib,
  pkgs,
  ...
}:
{
  home = {
    packages = [
      pkgs.vcs2l
    ];
  };

  programs = {
    bash = {
      initExtra = ''
        eval "$(${lib.getExe' pkgs.python3Packages.argcomplete "register-python-argcomplete"} colcon ros2)"
      '';
    };
  };
}
