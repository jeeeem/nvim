local lspconfig = require "lspconfig"

require'lspconfig'.html.setup{}

require'lspconfig'.tsserver.setup{}

require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}












