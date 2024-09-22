vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.cmd("let g:netrw_liststyle = 3")

vim.g.background = "light"

vim.opt.swapfile = false
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Vim Tmux navigator
vim.keymap.set("n", "C-h", "tmux.navigate.left<CR>")
vim.keymap.set("n", "C-j", "tmux.navigate.down<CR>")
vim.keymap.set("n", "C-k", "tmux.navigate.up<CR>")
vim.keymap.set("n", "C-l", "tmux.navigate.right<CR>")


vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

