{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ../common/default.nix
    ../common/shares.nix
    ../common/users.nix

    ./networking.nix
  ];

}
