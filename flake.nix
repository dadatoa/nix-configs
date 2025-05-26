{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # lix-module = {
    # url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
    # inputs.nixpkgs.follows = "nixpkgs";
    # };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:dadatoa/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # microvm = {
    #   url = "github:astro/microvm.nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    disko,
    nix-darwin,
    nixvim,
    ...
  }: {
    nixosConfigurations = {
      aarch64virtIso = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./customIso/aarch64virt.nix
        ];
      };
      x86_64Iso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./customIso/x86_64.nix
        ];
      };
      utmlab-1 = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          inputs.disko.nixosModules.default
          (import ./nixos/utmlab-1/disko.nix {device = "/dev/vda";})
          ./nixos/utmlab-1/configuration.nix
        ];
      };
      nara17 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          inputs.disko.nixosModules.default
          (import ./nixos/nara17/disko.nix {device = "/dev/nvme0n1";})
          ./nixos/nara17/configuration.nix
        ];
      };
      macmini = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          inputs.disko.nixosModules.default
          (import ./nixos/macmini/disko.nix {device = "/dev/sdb";})
          ./nixos/macmini/configuration.nix
        ];
      };
    };

    darwinConfigurations = {
      dadabook = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {inherit inputs;};
        modules = [
          # ./microvm.nixosModules.host
          ./darwin/dadabook.nix
        ];
      };
    };
  };
}
