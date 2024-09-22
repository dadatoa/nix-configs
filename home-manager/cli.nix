{ config, pkgs, ... }:
{

  # git configuration
  programs.git = {
    enable = true;
    userName = "dadatoa";
    userEmail = "f0a202@outlook.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  # shell fish
  programs.fish = {
    enable = true;
    loginShellInit = ''
      '';
    shellInitLast = ''
      starship init fish | source 
      '';
  };

  # zsh 
  programs.zsh = {
    enable = true;
    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };

  # bash
  programs.bash = {
  enable = true;
  bashrcExtra = ''
    eval "$(starship init bash)"
    '';
  profileExtra = ''
    '';
  };

  # z oxide
  programs.zoxide.enable = true;

  # bat
  programs.bat.enable = true;

  # eza (ls replacement)
  programs.eza = {
    enable = true; 
    enableZshIntegration = true;
    enableFishIntegration = true;
    git = true;
    icons = true;
    };
}
