{
  flake,
  pkgs,
  ...
}:
{
  imports = [
    flake.modules.home.laas
    flake.modules.home.ros
  ];

  home.packages = [
    pkgs.kitty
  ];

  # programs.kitty.enable = true; TODO
  programs.starship.enable = true;
}
