{
  description = "nixos configurations";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      # url = "github:nix-community/nixvim";
      url = "github:dadatoa/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { nixpkgs, nixpkgs-unstable, ... }@inputs:
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
            ./nixos/nrt17-1
          ];
        };

        macmini = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/macmini
          ];
        };

      };

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
