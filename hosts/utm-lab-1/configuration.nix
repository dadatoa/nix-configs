{ config, pckgs, ... }:
{
  imports = [
    ../modules/base-config.nix
    ../modules/users.nix
    /etc/nixos/hardware-configuration.nix
  ];

  networking.hostName = "utm-lab-1";
  networking.firewall.enable = false;
  
}
