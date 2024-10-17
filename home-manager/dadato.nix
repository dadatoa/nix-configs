{ config, pkgs, ... }:
let
  flavor = "frappe";
in 
{
  # include modules
  imports = [
    ./cli.nix
    ./nvim.nix
    ./tui.nix
  ];
  # Allow unfree for home-manager
  nixpkgs.config.allowUnfree = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dadato";
  home.homeDirectory = "/home/dadato";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    bat
    btop
    bun
    fish
    fzf 
    gh
    lazygit
    mc
    ncdu
    pv
    rclone
    rsync
    sesh
    starship
    stow
    tmux
    tmuxifier
    xclip
    zoxide
  ];

  # Global theme : catppuccin
  catppuccin = {
    enable = true;
    flavor = flavor;
  };
  programs.neovim.catppuccin = { enable = true; flavor = flavor; };
  programs.lazygit.catppuccin = { enable = true; flavor = flavor; };
  programs.fish.catppuccin = { enable = true; flavor = flavor; };
  programs.tmux.catppuccin = { enable = true; flavor = flavor; };
  programs.starship.catppuccin = { enable = true; flavor = flavor; };
  programs.btop.catppuccin = { enable = true; flavor = flavor; };
  programs.bat.catppuccin = { enable = true; flavor = flavor; };
  #
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
