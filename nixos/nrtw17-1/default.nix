### nrtv17-1
{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./configurtion.nix

    ../common/default.nix
    ../common/shares.nix
    ../common/users.nix

    ./networking.nix
    ./services.nix
  ];

}
