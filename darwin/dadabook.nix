{
  pkgs,
  inputs,
  ...
}:
{

  # services.nix-daemon.enabled = true;
  nix.settings.experimental-features = "nix-command flakes";
  # enable systemd
  # used for backwards compatibility
  system.stateVersion = 5;

  system.primaryUser = "dadatoa";

  # fingerprint for sudo
  security.pam.services.sudo_local.touchIdAuth = true;
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
    };
  };

  programs.zsh.enable = true;

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

  ## enable homebrew package manager
  ## does not install homebrew, have to install with standard procedure on mac os
  homebrew = {
    enable = true;
    casks = [
      "karabiner-elements"
      "leader-key"
      "ollama-app"
      "orbstack"
    ];
    brews = [ ];
  };
}
