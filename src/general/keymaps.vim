" --- Keymaps
let g:mapleader = ","
let g:maplocalleader = "\<Space>"

" Normal Mode
nmap <C-z> <nop>
nnoremap <C-p> :Files<CR>
"nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <A-e> :CocCommand explorer<CR>
nnoremap <A-d> :DBUIToggle<CR>
nnoremap <C-S> :w <CR>
nnoremap <S-TAB> :CtrlSpaceGoDown <CR>
nnoremap <TAB> :CtrlSpaceGoUp <CR>
nnoremap <F5> :so ~/.config/nvim/init.vim <CR>
nnoremap <leader>mv :mkview<CR>
nnoremap <leader>lv :loadview<CR>


" Use alt + hjkl to resize windows
nnoremap <A-R>    :resize <CR>
nnoremap <A-J>    :resize -2<CR>
nnoremap <A-K>    :resize +2<CR>
nnoremap <A-H>    :vertical resize -2<CR>
nnoremap <A-L>    :vertical resize +2<CR>

" Move line up & down like vscode
nnoremap <silent><A-j> :move .+1<CR>
nnoremap <silent><A-k> :move .-2<CR>

inoremap <silent> <A-j> <Esc>:move .+1<CR>
inoremap <silent> <A-k> <Esc>:move .-2<CR>=

vnoremap <silent><A-j> :move '>+1<CR>gv
vnoremap <silent><A-k> :move '<-2<CR>gv

" Adding new line in Normal mode
nnoremap <CR> O<ESC>j
nnoremap <S-CR> O

" Adding new line in Insert mode
inoremap <C-CR> <ESC>o
inoremap <S-CR> <ESC>O

" Going through windows
for key in range(1, 9)
	execute 'nnoremap <C-w>'.key key.'<C-w>w'
endfor

"if &term =~ '^screen'
    "" tmux will send xterm-style keys when its xterm-keys option is on
     ""execute "set <xUp>=\e[1;*A"
    ""execute "set <xDown>=\e[1;*B"
    ""execute "set <xRight>=\e[1;*C"
    ""execute "set <xLeft>=\e[1;*D"
    "execute "set <S-CR>=\e[13;2u"
    "execute "set <C-CR>=\e[13;5u"
"endif

" Insert mode
inoremap jk <ESC>
inoremap <C-S> <ESC> :w <CR>
inoremap <F2> :reg <CR>
"inoremap { {<CR>}<ESC>O 

" Navigation through Pop-up menu
" Cancel the auto-complete menu like ctrl+e would
inoremap <expr> <C-h> pumvisible() ? "\<C-e>" : "\<C-e>"

" Navigate using ctrl+j and ctrl+k in menu items
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Select the auto-complete menu like ctrl+y would
inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<C-l>"

nmap <F2> :registers <CR>

" Date shortcut
nmap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" ZoomWinTab
let g:zoomwintab_remap = 0
let g:zoomwintab_hidetabbar = 0
nmap <C-w>z :ZoomWinTabToggle <CR>

inoremap <silent><expr> <cr> <sid>handle_cr()

function! s:handle_cr() abort
  return pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endfunction
