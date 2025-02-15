configuration = {pkgs, lib, ...}: {
  services.nix-daemon.enabled = true;
  nix.settings.experimental-features = "nix-command flakes"

  # used for backwards compatibility
  system.stateVersion = 5;
  
  # fingerprint for sudo
  security.pam.enableSudoTouchIdAuth = true;
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
    }; 
  };
  
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    bat
    docker
    eza
    fish
    fzf
    gh
    git
    glab
    lazygit
    nodejs
    neovim
    fastfetch
    rclone
    rsync
    sesh
    starship
    stow
    telescope
    tmux
    wezterm
    zoxide
    zsh
  ];
}