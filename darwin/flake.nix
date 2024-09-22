{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
        url = "github:LnL7/nix-darwin";
        inputs.nixpkgs.follows = "nixpkgs";
	};
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    configuration = {pkgs, ... }: {
        services.nix-daemon.enable = true;
        nix.settings.experimental-features = "nix-command flakes";
        system.configurationRevision = self.rev or self.dirtyRev or null;
        # Used for backwards compatibility. please read the changelog
        system.stateVersion = 4;
        nixpkgs.hostPlatform = "aarch64-darwin";
        nixpkgs.config = {
          allowUnfree = true;
          };
        # fingerprint for sudo
        security.pam.enableSudoTouchIdAuth = true;
        # Declare the user that will be running `nix-darwin`.
        users.users.dadatoa = {
            name = "dadatoa";
            home = "/Users/dadatoa";
        };
        # Create /etc/zshrc that loads the nix-darwin environment.
        programs.zsh.enable = true;
        environment.systemPackages = with pkgs; 
          [
          bat
          direnv
          eza
          fastfetch
	        fish
          fzf
          gh
          git
          glab
          kitty
          lazygit
          neovim
          rclone
          rsync
          sesh
	        starship
	        stow
          telescope
          tmux
          zoxide
          ];
    };
  in
  {
    darwinConfigurations.dadabook = nix-darwin.lib.darwinSystem {
      modules = [
         configuration
	 home-manager.darwinModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.verbose = true;
                home-manager.users.dadatoa = import ./home.nix;
	 }
      ];
    };
  };
}
