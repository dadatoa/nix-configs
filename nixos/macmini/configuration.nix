{ config
, pkgs
, ...
}: {
  imports = [
    ../common-modules/configuration.nix
    ../common-modules/users.nix
    ./networking.nix
    ./dhcp.nix
    /etc/nixos/hardware-configuration.nix
  ];
  ## enable ip forwarding
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  environment.systemPackages = with pkgs; [
    thunderbolt
    canon-capt
  ];

  ## boot fail on mac mini without these
  boot.kernelParams = [ "vga=0x317" "nomodeset" ];

  ## Thunderbolt support
  services.hardware.bolt.enable = true;

  ## printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [ canon-capt ];
    allowFrom = [ "all" ];
    listenAddresses = [ "*:631" ];
    browsing = true;
    defaultShared = true;
    openFirewall = true;
  };


  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };
}
