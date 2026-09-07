{
  flake,
  ...
}:
{
  imports = [
    flake.modules.system.laas
    flake.modules.system.niri
  ];
}
