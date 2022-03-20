" Browser Neovim Integration

" Use this script to atch firefox to able to use ctrl-w  operator
" -----------------
" #!/usr/bin/env sh
"
" # Patching firefox to be able to use (c-w, c-n, c-t) in firenvim extension in firefox.
" sudo perl -i -pne 's/reserved="true"/               /g' /usr/lib/firefox/browser/omni.ja
" find ~/.cache/mozilla/firefox -type d -name startupCache | xargs rm -rf
" -----------------

" https://github.com/glacambre/firenvim#understanding-firenvims-configuration-object
let g:firenvim_config = {
    \ 'globalSettings': {
        \ '<C-w>': 'noop',
        \ '<C-n>': 'default',
    \ },
		\ 'localSettings': {
			\ '.*': {
				\ 'filename': '/tmp/{hostname}_{pathname%10}.{extension}',
						\ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'once',
				\}
			\}
\ }

" Change Neovim configuration when firenvim starts
if exists('g:started_by_firenvim') && g:started_by_firenvim
	""general options
	set nonumber 
	set noruler 
	set noshowcmd
	set background=dark
	set encoding=utf-8  
	""set guifont=Iosevka\ Nerd\ Font:h9

	let g:airline_extensions = []
	let g:airline_theme = 'dracula'
	" let g:coc_start_at_startup = v:false
	colorscheme tokyonight

	"" Focus out from the firenvim
	nnoremap <Esc><Esc> :call firenvim#focus_page()<CR>

	"" Remove firenvim integration
	nnoremap <C-z> :call firenvim#hide_frame()<CR>

	"" Resize font 
	let s:fontsize = 12
	function! AdjustFontSizeF(amount)
		let s:fontsize = s:fontsize+a:amount
		execute "set guifont=Iosevka\\ Nerd\\ Font:h" . s:fontsize
		call rpcnotify(0, 'Gui', 'WindowMaximized', 1)
	endfunction

	noremap  <C-=> :call AdjustFontSizeF(1)<CR>
	noremap  <C--> :call AdjustFontSizeF(-1)<CR>
	inoremap <C-=> :call AdjustFontSizeF(1)<CR>
	inoremap <C--> :call AdjustFontSizeF(-1)<CR>

	" Default firenvim window
	nnoremap <C-S-r> :set lines=35 columns=125<CR>

	augroup firenvim
		autocmd!
		"" Disable status line and tab line
		autocmd BufRead,BufNewFile * set laststatus=0
		autocmd BufRead,BufNewFile * set showtabline=0

		"" set filetype markdown when editing github textbox
		autocmd BufEnter github.com_*.txt set filetype=markdown

		"" set filetype markdown when editing leetcode textbox
		autocmd BufEnter leetcode.com_*.* set lines=35 columns=120
		autocmd BufEnter leetcode.com_*.* call v:lua.stop_lsp_client()

		""autocmd BufEnter *.txt setlocal filetype=html
		
	augroup END
endif


