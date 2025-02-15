{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, disko, nix-darwin, ... }: {
    nixosConfigurations = {
      aarch64virtIso = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [ 
          ./customIso/aarch64virt.nix 
          ];
      };
    };
  };
}
