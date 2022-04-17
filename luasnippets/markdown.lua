local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require "luasnip.util.events"
-- local ai = require "luasnip.nodes.absolute_indexer"

return {
	-- File structure for react
	s("file structure", {
		i(1, "src"),
		t {
			"",
			"├── ",
		},
		i(2, "components"),
		t {
			"",
			"│ └── ",
		},
		i(3),
		t {
			"",
			"├── ",
		},
		i(4, "pages"),
		t {
			"",
			"│ └── ",
		},
		i(5),
		t {
			"",
			"├── ",
		},
		i(6, "utils"),
		t {
			"",
			"│ └── ",
		},
		i(7),
		t {
			"",
			"├── ",
		},
		i(0, "assets"),
	}),
}
