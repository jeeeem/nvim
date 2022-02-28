local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	vim.notify "Nvim LSP Installer Error"
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local json_schemas = {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas {
						select = {
							".eslintrc",
							"package.json",
							"tsconfig.json",
							"prettierrc.json",
						},
					},
				},
			},
		}
		opts = vim.tbl_deep_extend("force", json_schemas, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require "user.lsp.settings.sumneko_lua"
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "pyright" then
		local pyright_opts = require "user.lsp.settings.pyright"
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server.name == "emmet_ls" then
		local emmet_opts = require "user.lsp.settings.emmet"
		opts = vim.tbl_deep_extend("force", emmet_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
