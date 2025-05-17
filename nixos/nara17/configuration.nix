{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../common-modules/configuration.nix
    ../common-modules/users.nix
    ../common-modules/virtualisation.nix
    ./storage.nix
    /etc/nixos/hardware-configuration.nix
  ];

  networking.hostName = "nara17";
  networking.useDHCP = false;
  # No local firewall.
  nat.enable = false;
  firewall.enable = false;

  # config reseau
  systemd.network = {
    enable = true;
    wait-online.anyInterface = true;
    networks = {
      "30-lan" = {
        matchConfig.Name = "enp2s0";
        address = [
          "10.120.17.5/24"
        ];
      };
    };
  };

  # dhcp
  services.dnsmasq.enable = true;
  services.dnsmasq.settings = {
    server = ["9.9.9.9" "8.8.8.8" "1.1.1.1"];
    domain-needed = true;
    bogus-priv = true;
    no-resolv = true;

    dhcp-range = ["enp2s0,10.120.17.21,10.120.17.64,48h"];
    dhcp-option = ["3,10.120.17.1"];
    dhcp-authoritative = true;
  };

  services.samba.enable = true;
  services.samba.package = pkgs.samba4Full;
  services.samba.openFirewall = true;
}
