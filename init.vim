" --- SOURCE FILES
" Plugins
source ~/.config/nvim/src/vim-plug/plugins.vim

" General Settings (Keymaps, Additional Commands, UI/UX Settings)
source ~/.config/nvim/src/general/settings.vim
source ~/.config/nvim/src/general/keymaps.vim
source ~/.config/nvim/src/general/indents.vim
source ~/.config/nvim/src/general/neovide.vim
 
" Theme Settings
source ~/.config/nvim/src/themes/gruvbox-material.vim
source ~/.config/nvim/src/themes/airline.vim

" Plugin Settings
"source ~/.config/nvim/src/plug-config/coc.vim
source ~/.config/nvim/src/plug-config/ctrl-space.vim
source ~/.config/nvim/src/plug-config/firenvim.vim
source ~/.config/nvim/src/plug-config/floaterm.vim
source ~/.config/nvim/src/plug-config/fugitive.vim
source ~/.config/nvim/src/plug-config/markdown.vim
source ~/.config/nvim/src/plug-config/multiple-cursor.vim
source ~/.config/nvim/src/plug-config/quickscope.vim
source ~/.config/nvim/src/plug-config/polygot.vim
"source ~/.config/nvim/src/plug-config/signify.vim
source ~/.config/nvim/src/plug-config/sneak.vim
source ~/.config/nvim/src/plug-config/startify.vim
source ~/.config/nvim/src/plug-config/tmuxline.vim
source ~/.config/nvim/src/plug-config/rainbow-parenthesis.vim
source ~/.config/nvim/src/plug-config/rnvimr.vim
source ~/.config/nvim/src/plug-config/vista.vim
source ~/.config/nvim/src/plug-config/which-key.vim
source ~/.config/nvim/src/plug-config/zen-mode.vim

luafile ~/.config/nvim/src/lua/plug-colorizer.lua
"luafile ~/.config/nvim/src/lua/lsp-config.lua

" Custom Plugins (or more like plugins with only a few LOC)
source ~/.config/nvim/src/custom/delete-hidden-buffers.vim
