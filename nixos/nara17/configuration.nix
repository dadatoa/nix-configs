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

  ## disable network manager to work with wp supplicant and systemd network instead
  networking.networkmanager.enable = false;

  ## wireless-related configuration
  networking.wireless.enable = true;
  networking.wireless.secretsFile = "/run/secrets/wireless.conf";
  networking.wireless.networks."Natcha5G" = {
    pskRaw = "ext:natcha17_psk";
  };
  ## allow user (wheel group) to interact with wpa_supplicant
  networking.wireless.userControlled.enable = true;

  ## manage network with systemd
  systemd.network.enable = true;

  systemd.network = {
    ## declare vlan
    netdevs = {
      "20-vlan100" = {
        netdevConfig = {
          Kind = "vlan";
          Name = "vlan100";
          Description = "LAN Access";
        };
        vlanConfig = {
          Id = 100;
        };
      };
    };
    ## network interfaces
    networks = {
      "30-lan" = {
        enable = true;
        matchConfig.Name = "enp2s0";
        networkConfig.DHCP = "ipv4";
        ## add vlans on physical interface
        vlan = [
          "vlan100"
        ];
      };
      ## add virtual interfaces for vlan
      "50-vlan100" = {
        matchConfig.Name = "vlan100";
        address = [
          "10.120.17.250/26"
          # "fd42:23:42:b865::1/64"
          # "fe80::1/64"
        ];
      };
    };
  };

  services.samba.enable = true;
  services.samba.package = pkgs.samba4Full;
  services.samba.openFirewall = true;
}
