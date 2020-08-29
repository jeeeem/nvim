" Enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let airline#extensions#tabline#current_first = 1
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" Enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Switch to your current theme
let g:airline_theme = 'gruvbox_material'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:webdevicons_enable_airline_tabline = 1

" Coc Integration
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = ' '
let airline#extensions#coc#warning_symbol = ' '
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Hunks Integration
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

" Ctrl-Space Integration
let g:airline#extensions#ctrlspace#enabled = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
let g:CtrlSpaceStatuslineFunction =
   \  "airline#extensions#ctrlspace#statusline()"


" Always show tabs
set showtabline=2

" Show tabs when zooming window
let g:zoomwintab_hidetabbar = 0

" We don't need to see things like -- INSERT -- anymore
set noshowmode











