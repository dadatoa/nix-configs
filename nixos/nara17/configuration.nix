{ config, lib, pkgs, ... }:
{
  imports = [
    ../common-modules/configuration.nix
    ../common-modules/users.nix
    ../common-modules/virtualisation.nix
    ./storage.nix
    /etc/nixos/hardware-configuration.nix
  ];

  networking.hostName = "nara17";
  networking.firewall.enable = false;
  # networking.interfaces.enp2s0.ipv4.addresses = [{
  #       address = "192.168.8.26";
  #       prefixLength = 24;
  #   }];
  # networking.interfaces.enp2s0.dhcp.enable = true;

  services.samba.enable = true;
  services.samba.package = pkgs.samba4Full;
  services.samba.openFirewall = true;
}
