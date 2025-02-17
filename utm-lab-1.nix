{ config, pckgs, ... }:
{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-utm-lab-1";
  networking.firewall.enable = false;
  
}
