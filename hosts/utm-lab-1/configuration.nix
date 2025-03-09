{ config, pkgs, ... }:
{
  imports = [
    ../common-modules/configuration.nix
    ../common-modules/users.nix
    ../common-modules/virtualisation.nix
    /etc/nixos/hardware-configuration.nix
  ];

  networking.hostName = "utm-lab-1";
  networking.firewall.enable = false;
  environment.systemPackages = [
  pkgs.sqlite
  ];

  services.tailscale.permitCertUid = "1000";

}
