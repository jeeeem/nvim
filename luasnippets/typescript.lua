local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascript" })
