{
  perSystem,
  pkgs,
  ...
}:
let
  inherit (pkgs) lib;
in
pkgs.writeShellScript "system-and-home-manager" ''
  ${lib.getExe perSystem.self.system}
  ${lib.getExe perSystem.self.home}
''
