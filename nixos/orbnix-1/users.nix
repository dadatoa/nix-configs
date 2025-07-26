## Orbnix additionnal users
{ ... }:
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
  };
}
