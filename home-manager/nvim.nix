{ config, pkgs, ... }:
{
  # neovim config
  programs.neovim = {
    extraPackages = with pkgs; [
      lua-language-server
      emmet-ls

      # tools
      ripgrep
      git
      cmake
      fzf
      gcc
      gnumake
      nodejs
      fswatch
      sqlite
    ];

    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
    
    # telescope
    telescope-nvim
    telescope-fzf-native-nvim
    telescope-ui-select-nvim
    plenary-nvim
      
    # treesitter
    {
      plugin = (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-python
        p.tree-sitter-json
        p.tree-sitter-astro
      ]));
    }

    # neo-tree
    neo-tree-nvim
    nvim-web-devicons
    nui-nvim

    # Oil file explorer
    oil-nvim

    # lsp && completions
    nvim-lspconfig
    cmp-nvim-lsp
    cmp_luasnip
    lsp-zero-nvim
    nvim-cmp

    friendly-snippets
    luasnip

    # none-ls for formatters and linters
    none-ls-nvim

    # Dashboard
    alpha-nvim

    # lualine
    lualine-nvim

    # Codeium
    codeium-nvim

    # vim tmux navigator
    vim-tmux-navigator

    # Debugging
    nvim-dap
    nvim-dap-ui

    # vim commentary
    nvim-comment
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/plugins/telescope.lua}
      ${builtins.readFile ./nvim/plugins/treesitter.lua}
      ${builtins.readFile ./nvim/plugins/neo-tree.lua}
      ${builtins.readFile ./nvim/plugins/lsp.lua}
      ${builtins.readFile ./nvim/plugins/none-ls.lua}
      ${builtins.readFile ./nvim/plugins/alpha.lua}
      ${builtins.readFile ./nvim/plugins/completions.lua}
      ${builtins.readFile ./nvim/plugins/lualine.lua}
      ${builtins.readFile ./nvim/plugins/oil.lua}
      ${builtins.readFile ./nvim/plugins/codeium.lua}
      ${builtins.readFile ./nvim/plugins/debugging.lua}
    '';

  };

}

