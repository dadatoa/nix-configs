## nixos/nara17/storage

{ ... }:
{
  fileSystems."/data/appdata" =
    {
      device = "/dev/sda1";
      fsType = "btrfs";
      options = [ "subvol=appdata" ];
    };

  fileSystems."/data/media" =
    {
      device = "/dev/sda1";
      fsType = "btrfs";
      options = [ "subvol=media" ];
    };

  fileSystems."/share" =
    {
      device = "/dev/sda1";
      fsType = "btrfs";
      options = [ "subvol=share" ];
    };

  fileSystems."/mnt/datapool" =
    {
      device = "/dev/sda1";
      fsType = "btrfs";
      options = [ "no-auto" "users" ];
    };

  # fileSystems."/mnt/share/public/Downloads" =
  #   { device = "/data/media/torrent/share";
  #     fsType = "none";
  #     options = [ "bind" "users" ];
  #   };
}
