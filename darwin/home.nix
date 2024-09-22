{ config, pkgs, ... }:

{
  # imports = [
    # ./nvim.nix
    # ];

  home.username = "dadatoa";
  home.homeDirectory = "/Users/dadatoa";
  home.stateVersion = "24.05";

  programs.git = {
    enable = true;
    userName = "dadatoa";
    userEmail = "f4ff52@hotmail.com";
    ignores = [ ".DS_Store" ];
    extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
