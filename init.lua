-- General Configuration
require "user.autocommands"
require "user.options"
require "user.keymaps"
require "user.impatient"
require "user.custom"
require "user.utils"

-- Colorschemes
require "user.colorschemes.tokyonight"

-- Plugins Configuration
require "user.notify"
require "user.plugins"
require "user.packer_compiled"
require "user.comment"
require "user.nvimtree"
require "user.lastplace"
require "user.colorizer"
require "user.zen"
require "user.autopairs"
-- require "user.indentline" --lazyloaded
require "user.gitsigns"
require "user.project"
require "user.toggleterm"
require "user.alpha"
--  require "user.telescope" -- lazyloaded
-- require "user.legendary" -- lazyloaded
-- require "user.whichkey" -- lazyloaded
require "user.trouble"
require "user.dial"
require "user.prettyfold"
require "user.focus"

-----------------------
-- require "user.dressing"
-- require "user.lualine"
-- require "user.tabline"
-- require "bufferline"
-----------------------

-- LSP Configuration
-- require "user.lsp" -- lazyloaded
-- require "user.cmp" --lazyloaded
-- require "user.treesitter" --lazyloaded

-- -- Compiler Configuration
require "user.compiler"

-- Debugger Configuration
require "user.debugger"

-- Custom && Vim plugins
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/airline.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/ctrlspace.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/markdown.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/zoomwintab.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/tmux.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/firenvim.vim]]
vim.cmd [[source ~/.nvim-lua-config/nvim/vim/custom/delete-hidden-buffers.vim]]
