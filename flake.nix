{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, disko, nix-darwin, ... }: {
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
          ./hosts/darwin/dadabook.nix
        ];
      };
    };
  };
}
