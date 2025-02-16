{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # microvm = {
    #   url = "github:astro/microvm.nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs@{ self, nixpkgs, disko, nix-darwin, lix-module, ... }: {
    nixosConfigurations = {
      aarch64virtIso = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [ 
          ./customIso/aarch64virt.nix 
          ];
      };
    };

    darwinConfigurations = {
      dadabook = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          # ./microvm.nixosModules.host
          ./hosts/darwin/dadabook.nix
          lix-module.nixosModules.default
        ];
      };
    };
  };
}
