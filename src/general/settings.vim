" --- General Settings

let g:python3_host_prog = '/usr/bin/python3'
syntax on
filetype plugin on
set hidden 
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set list
set listchars+=tab:->,eol:↩
set colorcolumn=150
set timeoutlen=800
set expandtab
set smarttab
set smartindent
set autoindent
set splitbelow
set splitright
set mouse=a
set nowrap
set ignorecase
set nocompatible
set encoding=UTF-8
set cursorline
set inccommand=nosplit
set guifont=Fira\ Code\ Nerd\ Font:h14
set clipboard+=unnamedplus
set clipboard=unnamedplus
set iskeyword+=-                              "Treat dash as a word text object"
set viewoptions-=options
autocmd BufRead * set formatoptions-=cro      "Stop new line continuation of comments"

highlight CocHighlightText  cterm=bold ctermfg=109 ctermbg=237 guifg=#83c07c

" Syntax Clearing for Rainbon Parenthesis syntax highlight
autocmd FileType javascript syntax clear jsIfElseBlock
autocmd FileType javascript syntax clear jsFuncBlock

" Automatic save and load folds

"augroup folds
    "autocmd BufWritePost *
    "\   if expand('%') != '' && &buftype !~ 'nofile'
    "\|      mkview
    "\|  endif
    "autocmd BufRead *
    "\   if expand('%') != '' && &buftype !~ 'nofile'
    "\|      silent loadview
    "\|  endif
"augroup END

" --- Keymaps
let g:mapleader = ","
let g:maplocalleader = "\<Space>"

" Normal Mode
nnoremap <C-p> :Files<CR>
"nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <A-e> :CocCommand explorer<CR>
nnoremap <C-S> :w <CR>
nnoremap <TAB> :CtrlSpaceGoDown <CR>
nnoremap <S-TAB> :CtrlSpaceGoUp <CR>
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

" Adding new line like vscode
nnoremap <S-CR> O

inoremap <C-CR> <ESC>o
inoremap <S-CR> <ESC>O

" Insert mode
inoremap jk <ESC>
inoremap <C-S> <ESC> :w <CR>
inoremap <F2> :reg <CR>
inoremap { {<CR>}<ESC>O 

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
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" --- UI/UX Settings

" Highlights on yanking
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Clear Registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" --- Indention Settings
"autocmd User prettier.formatFile IndentBlanklineRefresh
let g:indentLine_enabled = 1
let g:indentLine_first_char  = '|'
let g:indentLine_faster= 1
let g:indentLine_bufTypeExclude = ['help']
let g:indentLine_bufNameExclude = ['NERD_Tree.*','Startify.*', '_.*']
let g:indentLine_fileTypeExclude = ['coc-explorer']
let g:indentLine_showFirstIndentLevel  = 1
let g:indentLine_char_list = ['|']
let g:indent_blankline_char = '|'
"let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_leadingSpaceChar = '·'
"let g:indent_blankline_space_char = '.'
"let g:indent_blankline_extra_indent_level = -1

let g:indent_guides_auto_colors = 1

"let g:indent_guides_enable_on_vim_startup = 1
 let g:indent_guides_exclude_filetypes = ['help', 'nerdtree','startify']
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#233440 ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#44475a ctermbg=4

let g:zoomwintab_hidetabbar = 0
