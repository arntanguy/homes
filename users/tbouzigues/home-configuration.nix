{
  flake,
  perSystem,
  ...
}:
{
  imports = [
    flake.modules.home.laas
  ];

  home.packages = [
    perSystem.self.rstudio-wrapped-suid
  ];
}
