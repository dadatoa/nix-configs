{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common-modules/configuration.nix
    ../common-modules/users.nix
    /etc/nixos/hardware-configuration.nix
  ];

  ## boot fail on mac mini without these
  boot.kernelParams = ["vga=0x317" "nomodeset"];

  networking.hostName = "macmini";
  networking.firewall.enable = false;
  networking.interfaces.enp2s0f0.wakeOnLan.enable = true;

  # services.samba.enable = true;
  # services.samba.package = pkgs.samba4Full;
  # services.samba.openFirewall = true;

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
        matchConfig.Name = "enp2s0f0";
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
          "10.120.17.254/26"
          # "fd42:23:42:b865::1/64"
          # "fe80::1/64"
        ];
      };
    };
  };
}
