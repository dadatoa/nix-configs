{ lib, ... }:
{
  systemd.services.wifi = {
    enable = true;
    description = "My service is responsible for ...";
    after = [ "multi-user.target" ];
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.wpa_supplicant ];
    script = ''
      wpa_supplicant -c /etc/wpa_supplicant.conf -i wlp0s20f0u1   
    '';
  };
}
