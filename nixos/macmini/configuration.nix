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

  services.samba.enable = true;
  services.samba.package = pkgs.samba4Full;
  services.samba.openFirewall = true; 
}
