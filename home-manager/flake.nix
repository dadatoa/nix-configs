{
  description = "Home Manager configuration of dadato";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, catppuccin, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."dadato" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
          ./dadato.nix
          catppuccin.homeManagerModules.catppuccin
        ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      
      homeConfigurations."nixos" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
          ./nixos.nix
          catppuccin.homeManagerModules.catppuccin
        ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };

    };
}
