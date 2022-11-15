local snip_status_ok, _ = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-l>", "<Plug>luasnip-next-choice", {})

-- Documentation for luasnip
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md

-- Snippets
-- https://github.com/rafamadriz/friendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load()

