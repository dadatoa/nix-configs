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

  ## nfs service
  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /export 100.64.0.0/10(rw,fsid=0)
    /export/media 100.64.0.0/10(rw,fsid=0,no_subtree_check)
    /export/appdata 100.64.0.0/10(rw,fsid=0,no_subtree_check)
    /export/share 100.64.0.0/10(rw,fsid=0,no_subtree_check)
  '';
}
