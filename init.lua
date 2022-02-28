-- General Configuration
require "user.options"
require "user.keymaps"
require "user.autocommands"
require "user.impatient"

-- Plugins Configuration
require "user.plugins"
require "user.packer_compiled"
require "user.lastplace"
require "user.notify"
require "user.colorizer"
require "user.zen"
require "user.autopairs"
require "user.indentline"
require "user.comment"
require "user.gitsigns"
require "user.nvimtree"
require "user.project"
require "user.toggleterm"
require "user.alpha"
require "user.telescope"
require "user.legendary"
require "user.whichkey"
require "user.trouble"
require "user.dial"

-- require "user.dressing"
-- require "user.lualine"
-- require "user.tabline"
-- require "bufferline"

-- LSP Configuration
require "user.lsp"
require "user.cmp"
require "user.treesitter"

-- Compiler Configuration
require "user.compiler"

-- Debugger Configuration

-- Colorschemes
require "user.colorschemes.tokyonight"

-- Custom && Vim plugins
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/airline.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/ctrlspace.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/markdown.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/zoomwintab.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/tmux.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/firenvim.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/custom/delete-hidden-buffers.vim]]