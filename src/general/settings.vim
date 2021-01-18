" --- General Settings
let g:python3_host_prog = '/usr/bin/python3'
let g:better_escape_interval = 210

syntax on
filetype plugin indent on
set hidden 
set number
set relativenumber
"set tabstop=2
"set shiftwidth=2

" Set the tab width
let s:tabwidth=2
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth

set noexpandtab
set shiftround
"set smarttab
set smartindent
set autoindent
set conceallevel=2
set list
set listchars+=tab:->,eol:↩
set colorcolumn=100
set timeoutlen=200
set scrolloff=3
set mouse=a
set nowrap
set ignorecase
set nohlsearch
set incsearch
set noswapfile
set undofile
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
set showtabline=2 " Always show tabs
set noshowmode " We don't need to see things like -- INSERT -- anymore
set nobackup
set nowritebackup
set cmdheight=2 " Give more space for displaying messages.
set updatetime=100 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c " Don't pass messages to |ins-completion-menu|.

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

"augroup filetype_jsx
    "autocmd! FileType javascriptreact set filetype=javascript
"augroup END

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


