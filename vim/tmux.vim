let g:tmux_navigator_disable_when_zoomed = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_theme = 'airline'

let g:tmux_navigator_no_mappings = 0


" Explicit keymap for lazy laoding in packer 
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j>  :TmuxNavigateDown<cr>
nnoremap <silent> <C-k>  :TmuxNavigateUp<cr>
nnoremap <silent> <C-l>  :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

