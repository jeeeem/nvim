-- autocmd! remove all autocommands, if entered under a group it will clear that group

local api = vim.api

local general_settings = api.nvim_create_augroup("General Settings", { clear = true })
local diagnostics_highlight = api.nvim_create_augroup("Diagnostics Highlight", { clear = true })
local markdown = api.nvim_create_augroup("Markdown Settings", { clear = true })
local spectre = api.nvim_create_augroup("Markdown Settings", { clear = true })
local fold = api.nvim_create_augroup("Markdown Settings", { clear = true })

-- General settings augroup
-- api.nvim_create_autocmd("FileType qf,")

-- Diagnostics Highlight augroup
api.nvim_create_autocmd(
	"ColorScheme",
	{ command = "highlight DiagnosticVirtualTextError  guifg=#f53131 guibg=#fff", group = diagnostics_highlight }
)

api.nvim_create_autocmd(
	"ColorScheme",
	{ command = "highlight DiagnosticFloatingError  guifg=#fff guibg=#fff", group = diagnostics_highlight }
)

-- Markdown Augroup
-- api.nvim_create_autocmd(
-- 	"BufNewFile, BufFilePre, BufRead *.md",
-- 	{ command = "set filetype=markdown.pandoc", group = markdown }
-- )
-- api.nvim_create_autocmd("FileType vimwiki", {
-- 	callback = function()
-- 		vim.cmd [[set filetype=markdown.pancoc, set syntax=markdown]]
-- 	end,
-- 	group = markdown,
-- })

vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd BufWinEnter * :set nohlsearch
    " autocmd BufWinEnter * :set iskeyword+=-
    " autocmd BufWinEnter * :set sessionoptions+=tabpages,globals
    autocmd FileType qf set nobuflisted
  augroup end
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  augroup _markdown
    autocmd!
    autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    autocmd FileType vimwiki set filetype=markdown.pandoc, set syntax=markdown
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end
  augroup _lsp_codeaction
    autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb({sign= {enabled =false}, float= {enabled =true, text="ﯦ"}, win_opts={win_blend=80}, ignore={"null-ls"}})
    autocmd ColorScheme * highlight LightBulbFloatWin guifg=#EED333 
  augroup end
  " augroup diagnostics_highlight
  "   autocmd!
  "   autocmd ColorScheme * highlight DiagnosticVirtualTextError  guifg=#f53131 guibg=#fff
  "   autocmd ColorScheme * highlight DiagnosticFloatingError  guifg=#fff guibg=#fff
  " augroup end
  augroup spectre_highlight
    autocmd!
    autocmd ColorScheme * highlight DiffChange  guifg=#f53131 guibg=#fff
    autocmd ColorScheme * highlight DiffDelete  guifg=#00FF00 guibg=#fff
  augroup end
  augroup fold
    autocmd!
    autocmd BufWritePre * mkview
    autocmd BufRead * silent! loadview
  augroup end
  aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
  aug end
]]
