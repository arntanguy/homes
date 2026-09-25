{
  flake,
  ...
}:
{
  imports = [
    flake.modules.home.laas
    flake.modules.home.ros
  ];

  config = {
    programs.kitty.enable = true;
    programs.starship.enable = true;
  };
}
