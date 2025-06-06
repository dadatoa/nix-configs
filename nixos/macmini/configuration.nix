{ config
, pkgs
, ...
}: {
  imports = [
    ../common-modules/configuration.nix
    ../common-modules/users.nix
    ./networking.nix
    /etc/nixos/hardware-configuration.nix
  ];

  ## boot fail on mac mini without these
  boot.kernelParams = [ "vga=0x317" "nomodeset" ];

  ## printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [ canon-capt ];
    allowFrom = [ "all" ];
    listenAddresses = [ "*:631" ];
    browsing = true;
    defaultShared = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    canon-capt
  ];

  services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
  publish = {
    enable = true;
    userServices = true;
  };
};
}
