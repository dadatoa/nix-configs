{ pkgs, libs, inputs, ... }: {

  # services.nix-daemon.enabled = true;
  nix.settings.experimental-features = "nix-command flakes";
  # enable systemd
  # used for backwards compatibility
  system.stateVersion = 5;

  # fingerprint for sudo
  security.pam.services.sudo_local.touchIdAuth = true;
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
    };
  };

  programs.zsh.enable = true;


  # programs.nixvim = {
  #   enable = true;
  #     imports = [
  #       ../nixvim
  #     ];
  #     # nixpkgs.useGlobalPackages = true;
  # };

  environment.systemPackages = with pkgs; [
    inputs.nixvim.packages.${system}.default
    ansible
    bat
    docker
    eza
    ext4fuse
    fish
    fzf
    gh
    # ghostty  ## broken package
    git
    glab
    lazygit
    nmap
    nodejs
    fastfetch
    overmind # process manager
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
