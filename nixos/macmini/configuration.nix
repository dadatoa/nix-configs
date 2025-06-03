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

}
