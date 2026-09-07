{
  flake,
  ...
}:
{
  imports = [
    flake.modules.system.laas
    flake.modules.system.nvidia
  ];

  nvidiaDriverVersion = "595.84";
}
