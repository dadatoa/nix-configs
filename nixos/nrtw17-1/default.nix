### nrtv17-1
{ ... }:
{
  imports = [
    ./hw-configuration.nix
    ./configuration.nix

    ../common/default.nix
    ../common/shares.nix
    ../common/users.nix

    ./nas
    ./networking
    ./storage
  ];

}
