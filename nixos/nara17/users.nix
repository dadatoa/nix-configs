## nixos/nara17/users

{ pkgs, ... }:

{
  users = {
    users.nixos = {
      isNormalUser = true;
      uid = 1000;
      description = "services manager and system admin";
      extraGroups = [
        "wheel"
      ];
      shell = pkgs.zsh;
      # packages = with pkgs; [ ];
    };

    users.dadato = {
      # admin user defined to nixos
      isNormalUser = true;
      uid = 1001;
      description = "personnal account";
      extraGroups = [
        "wheel"
      ];
      shell = pkgs.nushell;
      # packages = with pkgs; [ ];
    };

    users.natcha = {
      isNormalUser = true;
      uid = 1002;
      description = "individual user";
      # extraGroups = [ "docker" "networkmanager" ];
      # packages = with pkgs; [ ];
    };

  };

  # no sudo password for admin users difined by belonging to wheel group
  # no password is set for these accounts
  # should only be accessed threw ssh with ssh key

  security.sudo.wheelNeedsPassword = false;

}
