{
  flake,
  ...
}:
{
  imports = [
    flake.modules.home.laas
    flake.modules.home.ros
  ];
}
