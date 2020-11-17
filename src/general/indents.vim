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


