{
  flake,
  ...
}:
{
  imports = [
    flake.modules.system.laas
    flake.modules.system.nvidia
  ];

  nvidiaDriverVersion = "575.64.03";
}
