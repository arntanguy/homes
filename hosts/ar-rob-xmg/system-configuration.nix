{
  flake,
  ...
}:
{
  imports = [
    flake.modules.system.lirmm
    flake.modules.system.niri
  ];
}
