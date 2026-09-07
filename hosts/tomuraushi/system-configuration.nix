{
  flake,
  ...
}:
{
  imports = [
    flake.modules.system.laas
    flake.modules.system.nvidia
  ];

  nvidiaDriverVersion = "580.173.02";
}
