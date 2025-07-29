{ ... }:
{
  ## mountpoints
  fileSystems."/export" = {
    device = "/mnt/datapool";
    options = [ "bind" ];
  };

  # fileSystems."/export/appdata" = {
  #   device = "/mnt/datapool/appdata";
  #   options = [ "bind" ];
  # };
  #
  # fileSystems."/export/share" = {
  #   device = "/mnt/datapool/share";
  #   options = [ "bind" ];
  # };

  ## nfs service
  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /export 100.64.0.0/10(rw,all_squash,anonuid=1000,anongid=100) 10.120.17.0/24(rw,all_squash,anonuid=1000,anongid=100)
  '';
}
