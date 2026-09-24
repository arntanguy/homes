# Nix need to know what is the current driver version on an host
# ref: https://github.com/soupglasses/nix-system-graphics
{
  lib,
  pkgs,
  hostName,
  ...
}:
let
  hashes = lib.importJSON ./nvidia-hashes.json;
  hosts = lib.importJSON ./nvidia-hosts.json;
  version = hosts.${hostName};
  sha256_64bit = hashes.${version} or lib.fakeHash;
in
{
  nixpkgs.config.allowUnfree = true;
  system-graphics.package =
    (pkgs.linuxPackages.nvidiaPackages.mkDriver {
      inherit version sha256_64bit;
      sha256_aarch64 = "";
      openSha256 = "";
      settingsSha256 = "";
      persistencedSha256 = "";
      patches = pkgs.linuxPackages.nvidiaPackages.stable.patches;
    }).override
      {
        libsOnly = true;
      };
}
