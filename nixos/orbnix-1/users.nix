## Orbnix additionnal users
{ pkgs, ... }:
{
  users.users.dadato = {
    isNormalUser = true;
    uid = 1000;
    description = "user for managing services";
    extraGroups = [
      "homelab"
      "users"
      "wheel"
    ];
    packages = with pkgs; [
      nushell
    ];
    shell = pkgs.nushell;
  };
}
