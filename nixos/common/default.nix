{ pkgs, inputs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.systemd-boot.consoleMode = "0";
  boot.loader.efi.canTouchEfiVariables = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # Set your time zone.
  time.timeZone = "Asia/Bangkok";

  i18n = {
    defaultLocale = "fr_FR.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    inputs.nixvim.packages.${system}.default # # nixvim -> custom nix neovim configuration
    bat
    btrfs-progs
    curl
    exfat
    fish
    fzf
    gh
    git
    glab
    hdparm
    lazygit
    nmap
    python3Minimal
    sesh
    starship
    tailscale
    tmux
    wezterm # allow ssh connect from my other machines with wezterm
    wget
    zoxide
  ];

  # start ssh-agent
  programs.ssh.startAgent = true;

  # Avahi for auto discover based on hostname
  services = {
    avahi = {
      publish = {
        enable = true;
        userServices = true;
      };
      enable = true;
      openFirewall = true;
      nssmdns4 = true;
    };

    # samba-wsdd for autodiscovery on windows
    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
  };
}
