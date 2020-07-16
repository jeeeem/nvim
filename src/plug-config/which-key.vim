" --- Which Key Settings
let g:which_key_map =  {}
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0

nnoremap <silent> <space> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <space> :<c-u> silent WhichKeyVisual '<Space>'<CR>

autocmd! User vim-which-key call which_key#register('<space>', 'g:which_key_map')


" Single key
let g:which_key_map['/'] = [ '<plug>NERDCommenterToggle'  , 'Comment Toggle' ]
let g:which_key_map.e = [ ':NERDTreeToggle'  , 'NERDTree' ]
"let g:which_key_map.q = [ ':q'  , 'Quit' ]
"let g:which_key_map.Q = [ ':q!'  , 'Force Quit' ]
let g:which_key_map.r = [ ':FloatermNew ranger'  , 'Ranger' ]
let g:which_key_map.S = [ ':Startify'  , 'Start Screen' ]
let g:which_key_map[' '] = [ ':WhichKey'  , 'Toggle Which Key' ]

" Group Key
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'A' : [':norm ggVG'        , 'Select All'],
      \ 'c' : [':ColorizerToggle'        , 'Colorizer'],
      \ 'h' : [':let @/ = ""'            , 'Remove current search highlight'],
      \ 'H' : [':set nohlsearch'         , 'Set no search highlight'],
      \ 'i' : [':IndentLinesToggle'     , 'Indent Lines'],
      \ 'I' : [':IndentGuidesToggle'     , 'Indent Guides'],
      \ 'n' : [':set nonumber!'          , 'Line-numbers'],
      \ 'r' : [':set norelativenumber!'  , 'Relative line nums'],
      \ 's' : [':RainbowToggle'         , 'Syntax Rainbow Toggle'],
      \ 't' : [':FloatermToggle'         , 'Terminal'],
      \ 'v' : [':Vista!!'                , 'Tag viewer'],
      \ 'z' : [':set wrap!'                , 'Word wrap'],
       \ }

let g:which_key_map.b = {
			\ 'name' : '+Buffer' ,
			\ 'l' : [':Buffers' , 'List Buffers'],
			\ 'n' : [':bnext'   , 'Next Buffer'],
			\ 'd' : [':bd!'      , 'Delete Buffer']
    \ }

let g:which_key_map.c = {
			\ 'name' : '+Coc-Commands' ,
      \ 'b' : [':CocCommand bookmark.annotate'    , 'Bookmark'],
      \ 'B' : [':CocList bookmark'    , 'List Bookmarks'],
      \ 'c' : [':CocCommand'    , 'Command List'],
      \ 'd' : [':CocDiagnostics'    , 'Diagnostics'],
      \ 'e' : [':CocCommand explorer'    , 'Explorer'],
      \ 'm' : [':CocList marketplace'    , 'Market Place'],
      \ 'f' : [':CocList diagnostics'    , 'FZF Diagnostics'],
      \ 's' : [':CocConfig'    , 'Coc Settings'],
      \ 'S' : [':CocCommand cSpell.toggleEnableSpellChecker'    , 'Toggle Spell Checker'],
      \ 't' : [':CocCommand todolist.create'    , 'Create Todo List'],
      \ 'T' : [':CocList todolist'    , 'Todo List'],
      \ 'v' : [':Vista coc'               , 'Coc Tag viewer'],
      \ 'r' : [':CocListResume'          , 'Last CocList Command'],
      \ 'x' : [':CocList extensions'    , 'Extensions'],
      \ 'y' : [':CocList -A --normal yank' , 'Yank List'],
      \ 'Y' : [':CocCommand yank.clean' , 'Clear Yank List'],
    \ }

let g:which_key_map.f = {
			\ 'name' : '+FZF' ,
			\ '/' : [':History/'     , 'history'],
			\ ';' : [':Commands'     , 'commands'],
			\ 'a' : [':Ag'           , 'text Ag'],
			\ 'b' : [':BLines'       , 'current buffer'],
			\ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
			\ 'C' : [':BCommits'     , 'buffer commits'],
	  	\ 'f' : [':Files'        , 'files'],
	    \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'r' : [':registers'    , 'Registers'],
      \ 'v' : [':Vista finder coc'    , 'Vista Coc fzf'],
      \ 'V' : [':Vista finder'    , 'Vista fzf'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
    \ }

let g:which_key_map.g = {
      \ 'name' : '+Git' ,
      \ 'a' : [':Git add .'                        , 'Add All'],
      \ 'A' : [':Git add %'                        , 'Add Current'],
      \ 'b' : [':Git blame'                        , 'Blame'],
      \ 'B' : [':GBrowse'                          , 'Browse'],
      \ 'c' : [':Git commit'                       , 'Commit'],
      \ 'd' : [':Git diff'                         , 'Diff'],
      \ 'D' : [':Gdiffsplit'                       , 'Diff Split'],
      \ 'g' : [':GGrep'                            , 'Git grep'],
      \ 'G' : [':Gstatus'                          , 'Status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'Highlight Hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'Preview Hunk'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'Next Hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'Prev Hunk'],
      \ 'l' : [':Git log'                          , 'Log'],
      \ 'p' : [':Git push'                         , 'Push'],
      \ 'P' : [':Git pull'                         , 'Pull'],
      \ 'r' : [':GRemove'                          , 'Remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'Stage Hunk'],
      \ 't' : [':GitGutterSignsToggle'             , 'Toggle Signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'Undo Hunk'],
      \ 'v' : [':GV'                               , 'View Commits'],
      \ 'V' : [':GV!'                              , 'View Buffer Commits'],
      \ }

let g:which_key_map.m = {
			\ 'name' : '+Session' ,
			\ 's' : [':SSave'   , 'Save Session'],
			\ 'l' : [':SLoad'      , 'Load Session'],
			\ 'd' : [':SDelete'      , 'Delete Session'],
			\ 'c' : [':SClose'      , 'Close Session'],
    \ }

let g:which_key_map.t = {
			\ 'name' : '+Tabs' ,
			\ 'c' : [':tabclose' , 'Close Tab'],
			\ 'e' : [':tabedit' , 'New Tab'],
			\ 'o' : [':tabonly' , 'Close Other Tab'],
			\ 'n' : [':tabnext' , 'Next Tab'],
			\ 'p' : [':tabprevious' , 'Previous Tab'],
			\ 't' : [':CtrlSpaceTabLabel' , 'Tab Label'],
			\ 'r' : [':tabrewind' , 'Rewind Tab'],
			\ 'f' : [':tabfirst' , 'First Tab'],
			\ 'l' : [':tablast' , 'Last Tab'],
    \ }

let g:which_key_map.w = {
			\ 'name' : '+Workspace' ,
			\ 'b' : [':CtrlSpace' , 'Buffer List'],
			\ 'n' : [':CtrlSpaceNewWorkspace' , 'New Workspace'],
			\ 's' : [':CtrlSpaceSaveWorkspace' , 'Save Workspace'],
			\ 'l' : [':CtrlSpaceLoadWorkspace' , 'Load Workspace'],
			\ 'a' : [':CtrlSpaceAddProjectRoot' , 'Add Project Root'],
			\ 'r' : [':CtrlSpaceRemoveProjectRoot' , 'Remove Project Root'],
    \ }

let g:which_key_map.z = {
			\ 'name' : '+ZenMode' ,
			\ 'z' : [':Goyo 150'  , 'Zen Mode '],
			\ 'l' : [':Limelight!! .8'  , 'Focus Mode '],
			\ 'x' : [':Goyo'      , 'Exit Zen Mode '],
    \ }

"let g:which_key_map.f = {
"			\ 'name' : '+Floaterm' ,
"			\ 'f' : [':FloatermNew fzf'     , 'Fuzzy-Finder'],
"    \ }
