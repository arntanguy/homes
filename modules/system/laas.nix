{
  inputs,
  lib,
  perSystem,
  ...
}:
{
  imports = [
    inputs.nix-system-graphics.systemModules.default
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  environment.systemPackages = [
    perSystem.self.element-desktop-wrapped-suid
  ];

  security.wrappers =
    let
      inherit (perSystem.self.electron-wrapped-suid) electron sandboxExecutableName;
    in
    {
      ${sandboxExecutableName} = {
        owner = "root";
        group = "root";
        setuid = true;
        source = "${electron}/libexec/electron/chrome-sandbox";
      };
    };

  system.autoUpgrade = {
    enable = true;
    dates = "daily";
    flake = "git+https://gitlab.laas.fr/pi2/homes";
  };

  system-graphics.enable = true;
}
