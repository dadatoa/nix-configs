{ config, lib, ... }:
{
  ## dhcp kea
  services.kea.dhcp4 = {
    enable = true;
    settings = {
      interfaces-config = {
        interfaces = [
          "enp2s0/10.120.17.248"
          "vlan100/10.120.17.65"
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
          pools = [ { pool = "10.120.17.249 - 10.120.17.254"; } ];
          subnet = "10.120.17.240/28";
          interface = "enp2s0";
          reservations = [
            {
              # easy smart managed router
              hw-address = "DC:62:79:B1:FD:DD";
              ip-address = "10.120.17.254";
            }
            # {
            #   hw-address = "C8:D9:D2:0B:D8:52";
            #   ip-address = "10.120.17.242";
            # }
          ];

          option-data = [
            {
              name = "routers";
              data = "10.120.17.248";
            }
            {
              name = "domain-name-servers";
              data = "10.120.17.248";
            }
          ];
        }
        {
          id = 2;
          pools = [ { pool = "10.120.17.97 - 10.120.17.126"; } ];
          subnet = "10.120.17.64/26";
          interface = "vlan100";
          option-data = [
            {
              name = "routers";
              data = "10.120.17.96";
            }
            {
              name = "domain-name-servers";
              data = "10.120.17.96";
            }
          ];
        }
      ];
    };
  };
}
