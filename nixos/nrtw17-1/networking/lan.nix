{ ... }:
{
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
        # address = [
        #   "10.120.17.248/28"
        # ];
        ## add vlans on physical interface
        vlan = [
          "vlan100"
        ];
      };
      ## add virtual interfaces for vlan
      "50-vlan100" = {
        matchConfig.Name = "vlan100";
        networkConfig.DHCP = "ipv4";
        # address = [
        #   "10.120.17.96/26"
        #   # "fd42:23:42:b865::1/64"
        #   # "fe80::1/64"
        # ];
      };
    };
  };

}
