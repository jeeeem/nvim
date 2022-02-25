if has("guirunning")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif

let g:CtrlSpaceDefaultMappingKey = "<C-space> "
"let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
"let g:CtrlSpaceSaveWorkspaceOnExit = 1

"nnoremap <silent> Q        :<c-u>CtrlSpace p<space>pcq<CR>
"nnoremap <silent> gQ       :<c-u>CtrlSpace p<space>pxcq<CR>

"nnoremap <buffer><silent><nowait>  Q  :<c-u>Bdelete<CR>
"nnoremap <buffer><silent><nowait> gQ  :<c-u>bdelete<CR>

command! -bang Bd call s:bdelete(expand("<bang>"))
cabbrev bd Bd

" Delete only the buffer in another tab
function! s:bdelete(bang)
  let curbufnr = bufnr("%")
  let altbufnr = bufnr("#")

  if buflisted(altbufnr)
    buffer #
  elseif len(filter(range(1, bufnr('$')), '! empty(bufname(v:val)) && buflisted(v:val)')) > 1
    bnext
  endif

  if bufnr("%") == curbufnr
    enew
  endif

  if buflisted(curbufnr)
    execute("bdelete". a:bang. " " . curbufnr)
  endif
endfunction

