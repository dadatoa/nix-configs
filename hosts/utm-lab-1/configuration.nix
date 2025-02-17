{ config, pckgs, ... }:
{
  imports = [
    ../modules/base-config.nix
    /etc/nixos/hardware-configuration.nix
  ];

  networking.hostName = "nixos-utm-lab-1";
  networking.firewall.enable = false;
  
}
