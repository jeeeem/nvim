local setup_ok, ts = pcall(require, "typescript")

if not setup_ok then
	return
end

local opts = {
	init_options = {
		hostInfo = "neovim",
		preferences = {
			includeInlayParameterNameHints = "none",
			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			includeInlayFunctionParameterTypeHints = false,
			includeInlayVariableTypeHints = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
		},
	},
	on_attach = function(client, bufnr)
		ts.setup {
			disable_commands = false, -- prevent the plugin from creating Vim commands
			disable_formatting = false, -- disable tsserver's formatting capabilities
			debug = false, -- enable debug logging for commands
			server = { -- pass options to lspconfig's setup method
				on_attach(client, bufnr),
			},
		}
	end,
}

return opts
