" --- Startify Settings
"let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_files_number = 5
let g:startify_fortune_use_unicode = 1
let g:startify_relative_path = 1

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/i3/config' },
            \ { 'v': '~/.config/nvim/init.vim' },
            \ { 'p': '~/.config/polybar/config' },
            \ { 'z': '~/.zshrc' },
            \ ]

let g:startify_custom_header = [
        \ '                ___           ___           ___           ___                       ___     ',
        \ '               /\__\         /\  \         /\  \         /\__\          ___        /\__\    ',
        \ '              /::|  |       /::\  \       /::\  \       /:/  /         /\  \      /::|  |   ',
        \ '             /:|:|  |      /:/\:\  \     /:/\:\  \     /:/  /          \:\  \    /:|:|  |   ',
        \ '            /:/|:|  |__   /::\~\:\  \   /:/  \:\  \   /:/__/  ___      /::\__\  /:/|:|__|__ ',
        \ '           /:/ |:| /\__\ /:/\:\ \:\__\ /:/__/ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\',
        \ '           \/__|:|/:/  / \:\~\:\ \/__/ \:\  \ /:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  /',
        \ '               |:/:/  /   \:\ \:\__\    \:\  /:/  /   |:|__/:/  /  \::/__/           /:/  / ',
        \ '               |::/  /     \:\ \/__/     \:\/:/  /     \::::/__/    \:\__\          /:/  /  ',
        \ '               /:/  /       \:\__\        \::/  /       ~~~~         \/__/         /:/  /   ',
        \ '               \/__/         \/__/         \/__/                                   \/__/    ',
        \]
