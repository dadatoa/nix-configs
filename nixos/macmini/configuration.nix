{ config, pkgs, ... }:
{
  boot.initrd.kernelModules = [ "wl" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  ## enable ip forwarding
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  ## boot fail on mac mini without these
  boot.kernelParams = [
    "vga=0x317"
    "nomodeset"
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

}
