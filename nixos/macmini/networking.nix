{
  config,
  lib,
  ...
}:
{

  networking.hostName = "macmini";
  networking.interfaces.enp2s0f0.wakeOnLan.enable = true;

  networking.firewall = {
    enable = true;
    extraCommands = ''
      # Set up SNAT on packets going from downstream to the wider internet
      iptables -t nat -A POSTROUTING -o wlp3s0 -j MASQUERADE

      # Accept all connections from downstream. May not be necessary
      iptables -A INPUT -i enp2s0f0 -j ACCEPT  
    '';
    allowedTCPPorts = [
      22
      53
      80
      443
      8080
      8443
    ];
    allowedUDPPorts = [
      53
    ];
  };
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
          "10.120.17.241/28"
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
          "10.120.17.65/26"
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
    userControlled.enable = true;
  };
}
