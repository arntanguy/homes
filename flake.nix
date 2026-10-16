{
  description = "home-manager configurations for LAAS members";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
    systems.url = "github:nix-systems/default";

    blueprint = {
      url = "github:numtide/blueprint/refs/pull/161/merge";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
    };

    home-manager = {
      url = "github:nix-community/home-manager/refs/pull/9855/merge";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    system-manager = {
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-system-graphics = {
      url = "github:soupglasses/nix-system-graphics";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim-wrapper-arnaud = {
      url = "github:arntanguy/nvim-wrapper";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.wrappers.inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.blueprint {
      inherit inputs;
      # Pass custom extraSpecialArgs or configure nixpkgs globally for home-manager if supported by your layout,
      # or configure allowUnfreePredicate inside your specific home modules (e.g. homes/arnaud/default.nix or similar).
      # Below is an example of passing extraSpecialArgs to home-manager via blueprint if applicable:
      nixpkgs.config = {
        allowUnfree = false;
        allowUnfreePredicate =
          pkg:
          builtins.elem (inputs.nixpkgs.lib.getName pkg) [
            "copilot-language-server"
            "vscode"
            "vscode-extension-ms-vscode-remote-remote-containers"
          ];
      };
    };
}
