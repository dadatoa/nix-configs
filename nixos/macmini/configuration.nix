{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../common-modules/configuration.nix
    ../common-modules/dns.nix
    ../common-modules/users.nix
    ../common-modules/virtualisation.nix
    ../common-modules/dhcp-kea-global.nix
    ./dhcp-kea-local.nix
    ./networking.nix
    ./services.nix
    /etc/nixos/hardware-configuration.nix
  ];
  ## enable ip forwarding
  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;

  environment.systemPackages = with pkgs; [
    thunderbolt
    canon-capt
  ];

  ## boot fail on mac mini without these
  boot.kernelParams = [
    "vga=0x317"
    "nomodeset"
  ];

  ## Thunderbolt support
  services.hardware.bolt.enable = true;

}
