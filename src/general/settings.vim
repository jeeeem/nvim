" --- General Settings
let g:python3_host_prog = '/usr/bin/python3'

syntax on
filetype plugin indent on
set hidden 
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set conceallevel=2
set list
set listchars+=tab:->,eol:↩
set colorcolumn=100
set timeoutlen=800
set expandtab
set smarttab
set smartindent
set autoindent
set mouse=a
set nowrap
set ignorecase
set nohlsearch
set incsearch
set noswapfile
set nocompatible 
set encoding=UTF-8
set cursorline
set inccommand=nosplit
set guifont=Fira\ Code\ Nerd\ Font:h14
set clipboard+=unnamedplus
set clipboard=unnamedplus
"set iskeyword+=-                              "Treat dash as a word text object
"set splitbelow
"set splitright
set viewoptions-=options
autocmd BufRead * set formatoptions-=cro      "Stop new line continuation of comments"

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Syntax Clearing for Rainbon Parenthesis syntax highlight
autocmd FileType javascript syntax clear jsIfElseBlock
autocmd FileType javascript syntax clear jsFuncBlock
autocmd FileType typescript syntax clear typescriptBlock
autocmd FileType typescript syntax clear typescriptFuncCallArg
"autocmd FileType typescript syntax clear typescriptArrowFuncDef
"autocmd FileType typescript syntax clear typescriptObjectLiteral

" I3 Syntax highlights
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

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

" --- UI/UX Settings

" Highlights on yanking
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Clear Registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

