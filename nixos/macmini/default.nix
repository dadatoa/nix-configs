### mac mini configuration

{ ... }:
{
  imports = [
    ./configuration.nix
    ./hw-conf.nix

    ../common/default.nix
    # ../common-modules/dns.nix
    ../common/users.nix
    # ../common-modules/virtualisation.nix
    # ../common-modules/dhcp-kea-global.nix
    ./dhcp-kea.nix
    ./networking.nix
    ./services.nix
  ];
}
