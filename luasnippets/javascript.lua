local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

return {
	ls.parser.parse_snippet("ctrig", "also loaded!!"),
}, {
	ls.parser.parse_snippet("autotrig", "autotriggered, if enabled"),
}
