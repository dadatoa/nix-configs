# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config
, pkgs
, modulesPath
, ...
}:

{
  imports = [
    ## include main configuration file from orbastck
    ./configuration.nix

    ## custom conf
    ./nfs-client.nix
    ./users.nix
    ../common/configuration.nix
    ../common/virtualisation/podman.nix
    # ../common/homelab
  ];

  ## custom configuration
  environment.systemPackages = with pkgs; [
    sesh
    jellyfin
  ];

}
