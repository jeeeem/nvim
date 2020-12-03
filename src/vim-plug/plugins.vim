 "vim plug https://github.com/junegunn/vim-plug
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Specify a directory for plugins
" Initialize plugin system
call plug#begin('~/.config/nvim/plugged')
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

" Workspaces / Session
Plug 'mhinz/vim-startify'
"Plug 'szw/vim-ctrlspace'
Plug 'vim-ctrlspace/vim-ctrlspace'

" Tagbar
Plug 'liuchengxu/vista.vim'

"Nvim Browser Integration
"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" IDE Pack (Syntax Highlighting, Linting, Auto-Completion, etc)
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'neoclide/jsonc.vim'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui' 
Plug 'mboughaba/i3config.vim'

" Rainbow Parenthesis
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'

" Markdown
" Tabular plugin is used to format tables
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'vim-pandoc/vim-pandoc-syntax'

 " Color highlighter
Plug 'norcalli/nvim-colorizer.lua'

" File Explorer
Plug 'preservim/nerdtree' 
Plug 'kevinhwang91/rnvimr'

" Version Control Integration
Plug 'airblade/vim-gitgutter'
"Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"Time Tracking
Plug 'wakatime/vim-wakatime' 

"Code Auto Completion
Plug 'mattn/emmet-vim' 

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Command line Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'

" Tmux-like Nagivation thru windows
Plug 'christoomey/vim-tmux-navigator'

"Status bar
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'

" Motion Plugins
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'kshenoy/vim-signature'

"Color Scheme
Plug 'sainnhe/gruvbox-material'
Plug 'dracula/vim', { 'as': 'dracula' }

" Floating Window
Plug 'voldikss/vim-floaterm'

" Pop-up Keybindings
Plug 'liuchengxu/vim-which-key'
" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

"Auto Formmater -- post install (yarn install | npm install) then load plugin only for editing supported files
"Plug 'prettier/vim-prettier', {
"  \ 'do': 'yarn install',
"  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }  

" Indention
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nathanaelkane/vim-indent-guides'

" Auto-Pairs, Commenter, Surround
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'

" Multiple Cursor
Plug 'mg979/vim-visual-multi'

" Tmux-like Zoom Window
Plug 'troydm/zoomwintab.vim'

" Zen Mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Repeating Complex Command
Plug 'tpope/vim-repeat'

" File Icons
Plug 'ryanoasis/vim-devicons'
call plug#end()
