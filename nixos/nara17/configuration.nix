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
  networking.hostId = "deadb33f";
  networking.firewall.enable = false;

  networking.interfaces.enp2s0 = {
    wakeOnLan.enable = true;
  };

  networking.interfaces.vlan100 = {
    ipv4.addresses = [
      {
        address = "10.120.17.250";
        prefixLength = 26;
      }
    ];
  };

  networking.vlans = {
    vlan100 = {
      id = 100;
      interface = "enp2s0";
    };
  };

  services.samba.enable = true;
  services.samba.package = pkgs.samba4Full;
  services.samba.openFirewall = true;
}
