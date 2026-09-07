{
  inputs,
  lib,
  perSystem,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nix-system-graphics.systemModules.default
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  environment = {
    etc =
      let
        name = "90laas-nix-path.sh";
      in
      {
        "profile.d/${name}".source = pkgs.writeText name ''
          for d in /run/system-manager/sw/bin $HOME/.nix-profile/bin; do
            if [[ -d $d && ":$PATH:" != *":$d:"* ]]; then
                export PATH="$d:$PATH"
            fi
          done
        '';
      };

    systemPackages = [
      perSystem.self.element-desktop-wrapped-suid
    ];
  };

  security.wrappers =
    let
      inherit (perSystem.self.element-desktop-wrapped-suid) electron sandboxExecutableName;
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
