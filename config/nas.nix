{ config, pkgs, ... }:
{
  networking = {
    hostName = "nara17";
    ## enable networking config with network manager
    networkmanager.enable = true;
    ## firewall
    firewall = {
      enable = false; # for testing purpose
    };

    # bridges = {
    #   "br0" = {
    #     interfaces = [ "enp2s0" "wlp0s20f0u5" ];
    #   };
    # };
  };

  services = {
    # samba file sharing
    samba = {
      package = pkgs.samba4Full;
      enable = true;
      openFirewall = true;
      extraConfig = ''
        workgroup = WORKGROUP
        security = user
        guest account = nobody
        '';
      shares = {
        share = {
          path = /mnt/share;
          writable = "yes";
          browseable = "yes";
          "guest ok" = "yes";
          "read only" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";
        };
      };
    };
    # Avahi for auto discover bades on hostname
    avahi = {
      publish = {
        enable = true;
        userServices = true;
      };
      enable = true;
      openFirewall = true;
    };
    # samba-wsdd for autodiscovery on windows
    samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
  };

}
