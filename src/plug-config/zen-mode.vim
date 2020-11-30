" Goyo Configuration

function! s:goyo_enter()
  "if executable('tmux') && strlen($TMUX)
    "silent !tmux set status off
    "silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  "endif
  set nolist
  set listchars=
  Limelight
endfunction

function! s:goyo_leave()
  "if executable('tmux') && strlen($TMUX)
    "silent !tmux set status on
    "silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  "endif
  set list
  set listchars+=tab:->,eol:↩
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Limelight Configuration
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
