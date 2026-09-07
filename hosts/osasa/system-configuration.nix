{
  flake,
  ...
}:
{
  imports = [
    flake.modules.system.laas
    flake.modules.system.nvidia
  ];

  nvidiaDriverVersion = "595.71.05";
}
