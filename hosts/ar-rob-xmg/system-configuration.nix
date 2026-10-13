{
  flake,
  ...
}:
{
  imports = builtins.trace "using host ar-rob-xmg" [
    # flake.modules.system.laas
    flake.modules.system.lirmm
    flake.modules.system.niri
  ];
}
