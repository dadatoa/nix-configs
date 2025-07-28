{ pkgs, ... }:
{
  boot.supportedFilesystems = [ "nfs" ];
  environment.systemPackages = with pkgs; [
    nfs-utils
  ];
  # filesystems."/data/media" = {
  #   device = "nara17.blue-edmontosaurus.ts.net:/media";
  #   fstype = "nfs";
  # };
  # filesystems."/data/appdata" = {
  #   device = "nara17.blue-edmontosaurus.ts.net:/appdata";
  #   fstype = "nfs";
  # };
}
