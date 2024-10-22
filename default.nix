{
  # Import all your configuration modules here
  imports = [

    # global config
    ./settings.nix
    ./keymaps.nix 

    # colorscheme
    ./catppuccin.nix

    # plugins
    ./bufferline.nix
    ./telescope.nix
    ./treesitter.nix
    ];
  
}
