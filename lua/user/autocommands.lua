-- autocmd! remove all autocommands, if entered under a group it will clear that group
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
  augroup diagnostics_highlight
    autocmd!
    autocmd ColorScheme * highlight DiagnosticVirtualTextError  guifg=#f53131 guibg=#fff
    " autocmd ColorScheme * highlight DiagnosticFloatingError  guifg=#f53131 guibg=#fff
    " autocmd ColorScheme * highlight DiagnosticVirtualTextError  guifg=#fff guibg=#fff
    autocmd ColorScheme * highlight DiagnosticFloatingError  guifg=#fff guibg=#fff
  augroup end
  augroup spectre_highlight
    autocmd!
    autocmd ColorScheme * highlight DiffChange  guifg=#f53131 guibg=#fff
    autocmd ColorScheme * highlight DiffDelete  guifg=#00FF00 guibg=#fff
  augroup end
  " augroup packer_user_config
  "   autocmd!
  "   autocmd BufWritePost plugins.lua source <afile> | PackerSync
  " augroup end
  augroup fold
    autocmd!
    autocmd BufWritePre * mkview
    autocmd BufRead * silent! loadview
  augroup end
  " augroup airline
  "   autocmd!
  "   " autocmd FileType html,css,javascriptreact,typescriptreact,lua echo "test"
  "   " autocmd FileType html,css,javascriptreact,typescriptreact,lua AirlineRefresh
  " augroup end
  " augroup FormatAutogroup
  "   autocmd!
  "   autocmd BufWritePost *.js, *.jsx,*.rs,*.lua,.*py Format
  " augroup END
  " augroup _alpha
  "   autocmd!
  "   autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  " augroup end
]]
