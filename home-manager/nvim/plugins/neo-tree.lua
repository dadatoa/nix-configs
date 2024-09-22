require("neo-tree").setup({
  vim.keymap.set('n', '<C-n>', ':Neotree toggle filesystem reveal left<CR>', {}),
  vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {}),
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
      },
    },
})

