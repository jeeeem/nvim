-- General Configuration
require "user.options"
require "user.keymaps"
require "user.autocommands"

-- Plugins Configuration
require "user.plugins"
require "user.impatient"
require "user.autopairs"
require "user.indentline"
require "user.comment"
require "user.gitsigns"
require "user.nvimtree"
require "user.project"
require "user.toggleterm"
require "user.alpha"
require "user.whichkey"

-- require "user.notify"
-- require "bufferline"

-- LSP Configuration
require "user.lsp"
require "user.cmp"
require "user.treesitter"

-- FZF
require "user.telescope"

-- Colorschemes
require "user.colorscheme"

-- Custom && Vim plugins
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/airline.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/ctrlspace.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/markdown.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/tmux.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/custom/delete-hidden-buffers.vim]]
