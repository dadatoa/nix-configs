### mac mini configuration

{ pkgs, ... }:
{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix

    ../common/default.nix
    # ../common-modules/dns.nix
    ../common/users.nix
    # ../common-modules/virtualisation.nix
    # ../common-modules/dhcp-kea-global.nix
    ./dhcp-kea-local.nix
    ./networking.nix
    ./services.nix
  ];
}
