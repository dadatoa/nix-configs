{
  description = "nixos configurations";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      # url = "github:nix-community/nixvim";
      url = "github:dadatoa/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { nixpkgs, ... }@inputs:
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
        orbnix-1 = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/orbnix-1
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
