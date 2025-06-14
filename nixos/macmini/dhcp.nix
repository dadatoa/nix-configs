{ config, lib, ... }: {
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
  };
}
