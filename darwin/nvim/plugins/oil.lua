require('oil').setup()
  vim.keymap.set('n', '<leader>e', require('oil').open, {})
  vim.keymap.set('n', '<leader>E', require('oil').open_float, {})
  vim.keymap.set('n', '-', require('oil').open, { desc = 'Open parent directory' })

