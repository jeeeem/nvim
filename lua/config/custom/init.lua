local loader = require("packer").loader
local ts_utils = require "nvim-treesitter.ts_utils"

-- Custom Commands

-- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting_sync()' ]]
-- vim.cmd [[ command! Rg execute 'Telescope live_grep' ]]

-- Custom Plugins

require "config.custom.functions"
