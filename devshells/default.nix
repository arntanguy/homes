{
  perSystem,
  pkgs,
  ...
}:
pkgs.mkShell {
  packages = [
    perSystem.home-manager.default
    perSystem.system-manager.default
  ];
}
