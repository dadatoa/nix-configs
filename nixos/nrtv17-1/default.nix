{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./configurtion.nix

    ../common/default.nix
    ../common/shares.nix
    ../common/users.nix

    ./networking.nix
  ];

}
