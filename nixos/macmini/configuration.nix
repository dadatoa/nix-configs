{ config, pkgs, ... }:
{
  imports = [
    ../common-modules/configuration.nix
    ../common-modules/users.nix
    /etc/nixos/hardware-configuration.nix
  ];
  
  boot.kernelParams = [ "vga=0x317" "nomodeset" ];
  
  networking.hostName = "macmini";
  networking.firewall.enable = false;
  networking.interfaces.enp2s0f0.ipv4.addresses = [{
        address = "192.168.0.3";
        prefixLength = 24;
    }];

  services.samba.enable = true;
  services.samba.package = pkgs.samba4Full;
  services.samba.openFirewall = true; 
}
