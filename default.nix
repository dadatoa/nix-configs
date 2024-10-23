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
    ./lualine.nix

    ## lsp configs
    ./lsp/conform.nix
    ./lsp/fidget.nix
    ./lsp/lsp.nix

    ./neo-tree.nix
    ./telescope.nix
    ./treesitter.nix
    ];
  
}
