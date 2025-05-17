{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../common-modules/configuration.nix
    ../common-modules/users.nix
    ../common-modules/virtualisation.nix
    ./storage.nix
    /etc/nixos/hardware-configuration.nix
  ];

  networking.hostName = "nara17";

  systemd.network = {
    enable = true;
    wait-online.anyInterface = true;
    networks = {
      "30-lan" = {
        matchConfig.Name = "enp2s0";
        address = [
          "10.120.17.5/24"
        ];
      };
    };
  };
  services.samba.enable = true;
  services.samba.package = pkgs.samba4Full;
  services.samba.openFirewall = true;
}
