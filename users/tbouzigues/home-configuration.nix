{
  flake,
  pkgs,
  ...
}:
{
  imports = [
    flake.modules.home.laas
  ];

  home.packages = [
    pkgs.rstudio
  ];
}
