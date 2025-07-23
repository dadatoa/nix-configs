{
  description = "my nix configurations";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      # url = "github:nix-community/nixvim";
      url = "github:dadatoa/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      nix-darwin,
      ...
    }@inputs:
    let

      forAllSystems =
        function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
          "aarch64-darwin"
        ] (system: function nixpkgs.legacyPackages.${system});

    in
    {
      nixosConfigurations = {
        ## virtual machines
        orbnix-1 = nixpkgs-unstable.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/orbnix-1
          ];
        };

        ## physical machines
        nrt17-1 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            inputs.disko.nixosModules.default
            (import ./nixos/nrt17-1/disko.nix { device = "/dev/nvme0n1"; })
            ./nixos/nrt17-1
          ];
        };

        macmini = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            inputs.disko.nixosModules.default
            (import ./nixos/macmini/disko.nix { device = "/dev/sdb"; })
            ./nixos/macmini
          ];
        };

      };

      ## darwin
      darwinConfigurations = {
        dadabook = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit inputs; };
          modules = [
            ./darwin/dadabook.nix
          ];
        };
      };

      ## dev shells
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [
            pkgs.git
            pkgs.glab
            pkgs.gh
          ];
        };
      });
    };

}
