{ config
, lib
, ...
}: {

  networking.hostName = "macmini";

  networking.firewall.enable = false;
  networking.interfaces.enp2s0f0.wakeOnLan.enable = true;

  ## manage network with systemd
  networking.useNetworkd = true;
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
        ## config dhcp
        # networkConfig.DHCP = "ipv4";
        ## config static ip
        address = [
          "10.120.17.254/28"
          # "fd42:23:42:b865::1/64"
          # "fe80::1/64"
        ];
        ## add vlans on physical interface
        vlan = [
          "vlan100"
        ];
      };
      ## add virtual interfaces for vlan
      "50-vlan100" = {
        matchConfig.Name = "vlan100";
        address = [
          "10.120.18.254/26"
          # "fd42:23:42:b865::1/64"
          # "fe80::1/64"
        ];
      };
    };
  };

  ## wireless
  networking.wireless = {
    enable = true;
    # secretsFile = "/run/secrets/wireless.conf";
    interfaces = [
      "wlp3s0"
    ];
    # networks."Natcha5G" = {
    #   pskRaw = "ext:natcha17_psk";
    # };
  };

  ## dhcp kea
  services.kea.dhcp4 = {
    enable = true;
    settings = {
      interfaces-config = {
        interfaces = [
          "enp2s0f0"
        ];
      };
      lease-database = {
        name = "/var/lib/kea/dhcp4.leases";
        persist = true;
        type = "memfile";
      };
      rebind-timer = 2000;
      renew-timer = 1000;
      subnet4 = [
        {
          id = 1;
          pools = [
            {
              pool = "10.120.17.241 - 10.120.17.253";
            }
          ];
          subnet = "10.120.17.240/28";
          # reservations = [
          #   {
          #     hw-address = "DC:62:79:B1:FD:DD";
          #     ip-address = "10.120.17.130";
          #   }
          # ];

          option-data = [
            {
              name = "routers";
              data = "10.120.17.254";
            }
            {
              name = "domain-name-servers";
              data = "10.120.17.254";
            }
          ];
        }
      ];
    };
  }
