# Nix need to know what is the current driver version on an host
# ref: https://github.com/soupglasses/nix-system-graphics
{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    nvidiaDriverVersion = lib.mkOption {
      description = "nvidia driver version";
      default = "";
      type = lib.types.str;
    };
  };

  config = {
    nixpkgs.config.allowUnfree = true;
    system-graphics.package =
      (pkgs.linuxPackages.nvidiaPackages.mkDriver {
        version = config.nvidiaDriverVersion;
        sha256_64bit = (
          (lib.importJSON ./nvidia-hashes.json).${config.nvidiaDriverVersion} or lib.fakeHash
        );
        sha256_aarch64 = "";
        openSha256 = "";
        settingsSha256 = "";
        persistencedSha256 = "";
        patches = pkgs.linuxPackages.nvidiaPackages.stable.patches;
      }).override
        {
          libsOnly = true;
        };
  };
}
