local api = vim.api
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

-- Augroups
local general_settings = augroup("General Settings", { clear = true })
local lsp = augroup("Lsp Settings", { clear = true })
local git = augroup("Git Settings", { clear = true })
local markdown = augroup("Markdown Settings", { clear = true })
local spectre = augroup("Specter Highlights", { clear = true })
local fold = augroup("Fold Persistence", { clear = true })
local i3config = augroup("I3config Syntax Highlight", { clear = true })

-- :h expand
-- %		current file name
-- #		alternate file name
-- #n		alternate file name n
-- <cfile>		file name under the cursor
-- <afile>		autocmd file name
-- <abuf>		autocmd buffer number (as a String!)
-- <amatch>	autocmd matched name
-- <sfile>		sourced script file or function name
-- <slnum>		sourced script line number or function
--     line number
-- <sflnum>	script file line number, also when in
--     a function
-- <SID>		"<SNR>123_"  where "123" is the
--     current script ID  |<SID>|
-- <cword>		word under the cursor
-- <cWORD>		WORD under the cursor
-- <client>	the {clientid} of the last received
--     message |server2client()|
-- Modifiers:
-- :p		expand to full path
-- :h		head (last path component removed)
-- :t		tail (last path component only)
-- :r		root (one extension removed)
-- :e		extension only

-- General settings Augroup
autocmd("FileType", {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	command = "nnoremap <silent> <buffer> q :close<CR>",
	group = general_settings,
})

autocmd("FileType", {
	pattern = "qf",
	command = "set nobuflisted",
	group = general_settings,
})

autocmd("FileType", {
	pattern = "undotree",
	command = "vertical resize 40",
	group = general_settings,
})

autocmd("BufWinEnter", {
	command = "set formatoptions-=cro | set nohlsearch",
	group = general_settings,
})

autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.cmd [[silent! lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})]]
	end,
	group = general_settings,
})

autocmd("VimResized", {
	command = "tabdo wincmd =",
	group = general_settings,
})

-- Diagnostics Highlight Augroup
autocmd("ColorScheme", { command = "highlight DiagnosticVirtualTextError  guifg=#f53131 guibg=#fff", group = lsp })
autocmd("ColorScheme", { command = "highlight DiagnosticFloatingError  guifg=#fff guibg=#fff", group = lsp })
autocmd("ColorScheme", { command = "highlight LightBulbFloatWin guifg=#EED333 ", group = lsp })
autocmd({ "CursorHold", "CursorHoldI" }, {
	pattern = "*",
	callback = function()
		local lightbulb = [[lua require("nvim-lightbulb").update_lightbulb {
			sign = { enabled = false },
			float = { enabled = true, text = "ﯦ" },
			win_opts = { win_blend = 80 },
			ignore = { "null-ls" },
		}]]
		-- vim.cmd(lightbulb)
		vim.cmd [[lua require'nvim-lightbulb'.update_lightbulb({sign= {enabled =false}, float= {enabled =true, text="ﯦ"}, win_opts={win_blend=80}, ignore={"null-ls"}})]]
	end,
	group = lsp,
})

-- Git Settings Augroup
autocmd("FileType", {
	pattern = "gitcommit",
	command = "setlocal wrap | setlocal spell",
	group = git,
})

-- Markdown Augroup
autocmd(
	{ "BufNewFile", "BufFilePre", "BufRead" },
	{ pattern = "*.md", command = "set filetype=markdown.pandoc", group = markdown }
)

autocmd("FileType", {
	pattern = "vimwiki",
	command = "set filetype=markdown.pandoc",
	group = markdown,
})

autocmd("FileType", {
	pattern = { "markdown", "markdown.pandoc" },
	callback = function()
		vim.cmd [[setlocal wrap | setlocal spell]]
	end,
	group = markdown,
})

-- Spectre Augroup
autocmd("ColorScheme", { pattern = "*", command = "highlight DiffChange  guifg=#f53131 guibg=#fff", group = spectre })
autocmd("ColorScheme", { pattern = "*", command = "highlight DiffDelete  guifg=#00FF00 guibg=#fff", group = spectre })

-- Fold Augroup
autocmd("BufWritePre", { pattern = "*", command = "mkview", group = fold })
autocmd("BufRead", { pattern = "*", command = "silent! loadview", group = fold })

-- i3 Augruop
autocmd("FileType", {
	pattern = "i3",
	callback = function()
		vim.schedule(function()
			vim.cmd [[set filetype=i3config]]
		end)
	end,
	group = i3config,
})

-- autocmd BufWinEnter * :set sessionoptions+=tabpages,globals
