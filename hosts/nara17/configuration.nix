{ config, lib, pkgs,  ... }:
{
  networking = {
    hostName = "nara17";
    ## enable networking config with network manager
    networkmanager.enable = true;
    ## firewall
    firewall = {
      enable = false; # for testing purpose
    };
  };

  fileSystems."/data/appdata" =
    { device = "/dev/sda1";
      fsType = "btrfs";
      options = [ "subvol=appdata" "users" ];
    };

  fileSystems."/data/media" =
    { device = "/dev/sda1";
      fsType = "btrfs";
      options = [ "subvol=media" "users" ];
    };

  fileSystems."/mnt/share" =
    { device = "/dev/sda1";
      fsType = "btrfs";
      options = [ "subvol=share" "users" ];
    };
  fileSystems."/mnt/datapool" =
    { device = "/dev/sda1";
      fsType = "btrfs";
      options = [ "no-auto" "users" ];
    };

  fileSystems."/mnt/share/public/Downloads" =
    { device = "/data/media/torrent/share";
      fsType = "none";
      options = [ "bind" "users" ];
    };

  

  services = {

    # samba file sharing
    samba = {
      package = pkgs.samba4Full;
      enable = true;
      openFirewall = true;
      
      settings = {
        global = {
          "guest account" = "nobody";
          # "workgroup" = "WORKGROUP";
          # "server string" = "smbnix";
          # "netbios name" = "smbnix";
          # security = user;
        };

        "Papa" = {
          "path" = "/mnt/share/Papa";
          "writable" = "yes";
          "browseable" = "yes";
          # "guest ok" = "yes";
          # "read only" = "no";
          # "create mask" = "0644";
          # "directory mask" = "0755";
        };

        "Natcha" = {
          "path" = "/mnt/share/Natcha";
          "writable" = "yes";
          "browseable" = "yes";
          # "guest ok" = "yes";
          # "read only" = "no";
          # "create mask" = "0644";
        };

        "Public" = {
          "path" = "/mnt/share/public";
          "writable" = "yes";
          "browsable" = "yes";
          "guest ok" = "yes";
          "read only" = "no";
          "force user" = "nobody";
          "force group" = "nogroup";
          # "create mask" = "666";
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
