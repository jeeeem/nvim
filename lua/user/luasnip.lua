local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

-- luasnip.filetype_extend("typescriptreact", { "javascriptreact" })
require("luasnip/loaders/from_vscode").lazy_load()

return luasnip
