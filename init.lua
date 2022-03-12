-- General Configuration
require "config.autocommands"
require "config.options"
require "config.keymaps"
require "config.impatient"
require "config.filetype"
require "config.custom"
require "config.utils"

-- Colorschemes
require "config.colorschemes.tokyonight"

-- Plugins Configuration
require "config.notify"
require "config.plugins"
require "config.packer_compiled"
require "config.comment"
require "config.nvimtree"
require "config.lastplace"
require "config.colorizer"
require "config.zen"
require "config.autopairs"

-- require "config.indentline" --lazyloaded
require "config.gitsigns"
require "config.project"
require "config.toggleterm"
require "config.alpha"
--  require "config.telescope" -- lazyloaded
-- require "config.legendary" -- lazyloaded
-- require "config.whichkey" -- lazyloaded
require "config.trouble"
require "config.dial"
require "config.prettyfold"
require "config.focus"
require "config.spectre"
require "config.regex"
require "config.hop"
require "config.harpoon"

-- LSP Configuration
-- require "config.lsp" -- lazyloaded
-- require "config.cmp" --lazyloaded
-- require "config.treesitter" --lazyloaded

-- Compiler Configuration
require "config.compiler"

-- Debugger Configuration
require "config.debugger"

-- Custom && Vim plugins
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/airline.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/ctrlspace.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/markdown.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/zoomwintab.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/tmux.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/firenvim.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/custom/delete-hidden-buffers.vim]]
