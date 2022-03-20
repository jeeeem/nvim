" Enable tabline

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#current_first = 1
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#ctrlspace_show_tab_nr = 1
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_highlighting_cache = 1

let g:airline_extensions = ['tabline', 'ctrlspace']
let g:airline_exclude_filetypes = ['alpha'] 

let g:airline_filetype_overrides = {
  \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
  \ 'help':  [ 'Help', '%f' ],
  \ 'alpha': [ 'Alpha', '' ],
  \ 'dapui_scopes': [ 'Scopes', '' ],
  \ 'dapui_breakpoints': [ 'Breakpoints', '' ],
  \ 'dapui_watches': [ 'Watches', '' ],
  \ 'dapui_stacks': [ 'Stacks', '' ],
  \ 'dap-repl': [ 'REPL', '' ],
  \ 'Outline': [ 'LSP Symbols', '' ],
  \ 'NvimTree': [ 'File Tree', '' ],
  \ 'spectre_panel': [ 'Search and Replace', '' ],
  \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
  \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
  \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
  \ 'undotree' : [ 'Undo Tree', '' ],
  \ }

" Enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Switch to your current theme
let g:airline_theme = 'tomorrow'
" let g:airline_theme = 'dark_minimal'
let g:nvim_web_devicons_airline = 1

let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:webdevicons_enable_airline_tabline = 1

" Ctrl-Space Integration
let g:airline#extensions#ctrlspace#enabled = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
let g:CtrlSpaceStatuslineFunction =
   \  "airline#extensions#ctrlspace#statusline()"

" Custom Customization
let g:airline_section_c = '[%{winnr()}] %t %r'

" Statusline Cheatsheet :h statusline
"set statusline=%t                                       " tail of the filename
"set statusline+=\ %h                                    " help file flag
"set statusline+=%m                                      " modified flag
"set statusline+=%r                                      " read only flag
"set statusline+=%y                                      " filetype
"set statusline+=%=                                      " left/right separator
"set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},       " file encoding
"set statusline+=%{&ff}]\                                " file format
"set statusline+=%c\                                     " cursor column
"set statusline+=%l/%L\                                  " cursor line/total lines
"set statusline+=\ %{strftime(\"%H:%M\")}                " time

