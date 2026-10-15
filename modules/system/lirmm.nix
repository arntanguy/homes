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
    flake = "path:/home/arnaud/devel/laas/pi2/homes";
  };

  system-graphics.enable = builtins.trace "[lirmm] enabling system-graphics" true;
}
