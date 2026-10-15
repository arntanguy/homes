{
  flake,
  ...
}:
{
  imports = [
    flake.modules.system.lirmm
    (builtins.trace "[ar-xmg-rob] importing nvidia module" flake.modules.system.nvidia)
    flake.modules.system.niri
  ];
}
