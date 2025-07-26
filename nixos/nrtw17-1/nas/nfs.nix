{ ... }:
{
  ## mountpoints
  fileSystems."/export/media" = {
    device = "/mnt/datapool/media";
    options = [ "bind" ];
  };

  fileSystems."/export/appdata" = {
    device = "/mnt/datapool/appdata";
    options = [ "bind" ];
  };

  fileSystems."/export/share" = {
    device = "/mnt/datapool/share";
    options = [ "bind" ];
  };
}
