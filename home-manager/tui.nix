{ config, pkgs, ... }:
{
  # tmux
  programs.tmux = {
    enable = true;
    
    extraConfig = ''
    unbind r
    bind r source-file ~/.config/tmux/tmux.conf 
    set -g prefix C-s

    set -g mouse on

    set -g default-shell ~/.nix-profile/bin/fish
    set -g default-terminal "screen-256color"
    set -g base-index 1
    set -g pane-base-index 1
    set-window-option -g pane-base-index 1
    set-option -g renumber-windows on

    setw -g mode-keys vi
    bind-key h select-pane -L
    bind-key j select-pane -D
    bind-key k select-pane -U
    bind-key l select-pane -R

    set-option -g status-position top
    '';

    plugins = with pkgs.tmuxPlugins; [
    vim-tmux-navigator
    ]; 
  };

  # lazygit
  programs.lazygit = {
    enable = true;
  };

  # starship prompt
  programs.starship = {
    enable = true;
    settings = {
      shell = {
        fish_indicator = "󰈺";
        bash_indicator = "󱆃";
        zsh_indicator = "z";
        style = "cyan bold";
        disabled = false;
      };
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };

      # package.disabled = true;
    };
  };

  # btop
  programs.btop = {
    enable = true;
  };

}
