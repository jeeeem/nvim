" --- Sneak Settings

let g:sneak#label = 1

" Case insensitive sneak
let g:sneak#use_ic_scs = 0

" Immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

" Remap Sneak default key
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S

xmap <leader>s <Plug>Sneak_s 
xmap <leader>Z <Plug>Sneak_S
" Remap so I can use , and ; with f and t

map gS <Plug>Sneak_,
map gs <Plug>Sneak_;

" Change the colors
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan cterm=bold
highlight SneakScope guifg=red guibg=#00c7DF ctermfg=red ctermbg=cyan cterm=bold

" Cool prompts
 let g:sneak#prompt = ' '
