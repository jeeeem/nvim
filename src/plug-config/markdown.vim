" --- Vim-Markdown Settings
" Disable header folding
let g:vim_markdown_folding_disabled = 1

" Do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" Disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" Support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" ---Pandoc Settings
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" ---Vim Wiki Settings
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'index': 'README',
                      \ 'syntax': 'markdown',
                      \  'ext': '.md'}]
let g:vimwiki_global_ext = 0

nmap <leader><Tab> <Plug>VimwikiNextLink
nmap <leader><S-Tab> <Plug>VimwikiPrevLink
