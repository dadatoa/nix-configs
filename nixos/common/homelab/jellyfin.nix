{ ... }:
{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    # dataDir = "/data/appdata/jelly";
    # user = "datato";
    # group = "users";
  };
}
