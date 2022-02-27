local opts = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				maxPreload = 5000,
				preloadFileSize = 1000,
				checkThirdParty = false,
				--library = vim.api.nvim_get_runtime_file('', true),
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.stdpath "config" .. "/lua"] = true,
				},
			},
		},
	},
}

local lua_dev_loaded, lua_dev = pcall(require, "lua-dev")
if not lua_dev_loaded then
	return opts
end

local dev_opts = {
	library = {
		vimruntime = true, -- runtime path
		types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
		-- plugins = true, -- installed opt or start plugins in packpath
		-- you can also specify the list of plugins to make available as a workspace library
		plugins = { "plenary.nvim" },
	},
	lspconfig = opts,
}

return lua_dev.setup(dev_opts)
