local status_ok, focus = pcall(require, "focus")

if not status_ok then
	return
end

focus.setup {
	enable = true,
	autoresize = false,
	excluded_filetypes = { "alpha", "fterm", "term", "toggleterm", "NvimTree", "Trouble" },
	-- compatible_filetrees = { "nvimtree" },
	signcolumn = false,
	cursorcolumn = false,
	number = false,
	relativenumber = false,
	hybridnumber = false,
	winhighlight = false,
}
