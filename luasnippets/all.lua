local M = {}

-- export all snippets methods for reusability

local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
-- local events = require "luasnip.util.events"
-- local ai = require "luasnip.nodes.absolute_indexer"

local function simple_restore(args, _)
	return sn(nil, { i(1, args[1]), r(2, "dyn", i(nil, "user_text")) })
end

return {
	-- Current time
	s(
		"curtime",
		f(function()
			return os.date "%D - %H: %M"
		end)
	),
}
