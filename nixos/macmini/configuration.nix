{ config, lib, pkgs, ... }:
{
  ## enable ip forwarding
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  ## boot fail on mac mini without these
  boot.kernelParams = [
    "vga=0x317"
    "nomodeset"
  ];

  ## Allow insecure packages for wifi broadcom on mac mini
  nixpkgs.config.allowInsecurePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "broadcom-sta" # aka “wl”
  ];

  environment.systemPackages = with pkgs; [
    thunderbolt
    canon-capt
  ];

  services = {
    # Enable ssh
    openssh = {
      enable = true;
      openFirewall = true;
    };

    # Enable Tailscale
    tailscale.enable = true;
    tailscale.openFirewall = true;

    # Avahi for auto discover based on hostname
    avahi = {
      publish = {
        enable = true;
        userServices = true;
      };
      enable = true;
      openFirewall = true;
      nssmdns4 = true;
    };

    ## Thunderbolt support
    hardware.bolt.enable = true;
  };

  
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
