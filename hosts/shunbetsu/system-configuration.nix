{
  flake,
  ...
}:
{
  imports = [
    flake.modules.system.laas
    flake.modules.system.nvidia
  ];

  nvidiaDriverVersion = "535.309.01";
}
