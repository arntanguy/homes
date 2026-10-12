{
  pkgs,
  inputs,
  flake,
  ...
}:
let
  treefmtEval = inputs.treefmt.lib.evalModule pkgs ../treefmt.nix;
in
treefmtEval.config.build.check flake
