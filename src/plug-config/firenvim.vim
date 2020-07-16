" Browser Neovim Integration
"
if exists('g:started_by_firenvim') && g:started_by_firenvim
	"general options
	set laststatus=0 nonumber noruler noshowcmd

	augroup firenvim
		autocmd!
		autocmd BufEnter *.txt setlocal filetype=html
	augroup END
endif
