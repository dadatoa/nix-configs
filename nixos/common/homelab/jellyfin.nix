{ ... }:
{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    # configDir = "/data/appdata/jelly";
    # dataDir = "/data/media";
  };
}
