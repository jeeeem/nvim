local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md

-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require "luasnip.util.events"
-- local ai = require "luasnip.nodes.absolute_indexer"

-- https://github.com/rafamadriz/friendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()
-- require("luasnip.loaders.from_lua").lazy_load { paths = "~/.nvim-lua-config/nvim/snippets" }
require("luasnip.loaders.from_lua").lazy_load()
