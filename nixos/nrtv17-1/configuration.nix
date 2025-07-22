{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ansible
    kea
    overmind
    pv
  ];

  services = {
    # Enable ssh
    openssh = {
      enable = true;
      openFirewall = true;
    };

    # Enable Tailscale
    tailscale.enable = true;
    tailscale.openFirewall = true;

    # samba
    samba = {
      enable = true;
      package = pkgs.samba4Full;
      openFirewall = true;
    };
  };
}
