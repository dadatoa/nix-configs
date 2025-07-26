{ ... }:
{
  boot.supportedFilesystems = [ "nfs" ];
  filesystems."/data/media" = {
    device = "nara17.blue-edmontosaurus.ts.net:/media";
    fstype = "nfs";
  };
  filesystems."/data/appdata" = {
    device = "nara17.blue-edmontosaurus.ts.net:/appdata";
    fstype = "nfs";
  };
}
