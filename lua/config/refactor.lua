local status_ok, refactor = pcall(require, "refactoring")

if not status_ok then
	return
end

refactor.setup {
	prompt_func_return_type = {
		go = true,
		cpp = true,
		c = true,
		java = true,
		lua = true,
	},
	-- prompt for function parameters
	prompt_func_param_type = {
		go = true,
		cpp = true,
		c = true,
		java = true,
		lua = true,
	},
}

vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	":lua require('refactoring').select_refactor()<CR>",
	{ noremap = true, silent = true, expr = false }
)
