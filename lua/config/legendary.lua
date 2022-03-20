local status_ok, legendary = pcall(require, "legendary")

if not status_ok then
	return
end

-- local keymaps = {
-- 	-- 'mode' defaults to 'n', but you can specify a different mode
-- 	-- either as a string or a list of multiple modes like `mode = { 'n', 'v' }`
-- 	{ "gc", ":'<,'>CommentToggle<CR>", mode = "v", description = "Toggle comment" },
-- 	-- you can also pass keymap options via the `opts` table, see `:h vim.keymap.set`
-- 	-- and `:h nvim_set_keymap` for all available options
-- 	-- default opts are `opts = { silent = true }`
-- 	{ "<leader>y", ":SomeMappingCommand", opts = { noremap = true, silent = false } },
-- 	-- you can also map lua functions directly as a binding
-- 	-- note that implementations are evaluated immediately
-- 	{ "<C-p>", require("legendary").find, description = "Search key bindings" },
-- 	-- if you need to bind a key to call a function with specific arguments
-- 	-- you can use the `require('legendary').lazy()` helper function
-- 	-- `nil` and `1500` will be passed as the arguments to `formatting_sync` when called
-- 	{
-- 		"<leader>p",
-- 		require("legendary").lazy(vim.lsp.buf.formatting_sync, nil, 1500),
-- 		description = "Format with 1.5s timeout",
-- 	},
-- 	-- or, if you need to bind a key to a function from a plugin,
-- 	-- this will call `require('telescope.builtin').oldfiles({ only_cwd = true })` when triggered
-- 	{ "<leader>f", require("legendary").lazy_required_fn("telescope.builtin", "oldfiles", { only_cwd = true }) },
-- 	-- Or add a keybind without a definition (useful for reminding yourself of
-- 	-- keybinds which are set up by plugins, for example, these nvim-cmp mappings)
-- 	{ "<C-d>", description = "Scroll docs up" },
-- 	{ "<C-f>", description = "Scroll docs down" },
-- }

-- Define your commands with the same table structure
-- Again, description is required for them to appear when you search
local commands = {
	-- You can also use legendar.nvim to create commands!
	{ ":DoSomething", ':echo "something"', description = "Do something!" },
	-- You can also set commands to run a lua function
	-- { ":DoSomethingWithLua", require("my_module").some_method, description = "Do something with Lua!" },
	-- You can also define commands without an implementation
	-- this will simply make it appear in vim.ui.select() UI
	-- but will not create the command
	{ ":CommentToggle", description = "Toggle comment" },
	-- You can also have "unfinished" command (commands which need an argument)
	-- by setting `unfinished = true`. You can use `{arg_name}` or `[arg_name]`
	-- at the end of the string as a hint, this will get removed when inserted
	-- to the command line
	{ ":MyCommand {some_argument}<CR>", description = "Command with argument", unfinished = true },
	-- or
	{ ":MyCommand [some_argument]<CR>", description = "Command with argument", unfinished = true },
}

-- Define autocommands with a slightly different table structure
-- the elemensts of the table can be augroups or autocommands,
-- augroups will contain autocommands inside them
local autocommands = {
	-- augroup example
	{
		name = "LspFormat",
		clear = false, -- default true
		{
			-- event can be a string or table of strings like { 'BufWritePre', 'BufWritePost' }
			"BufWritePre",
			-- definition can be a string or a lua function
			-- require("my-lsp-utils").format,
			-- description is required for them to appear in finder,
			-- but you can omit if if you don't need it to appear
			-- in the finder
			description = "Format with LSP on save",
			opts = {
				-- autocommand pattern to match, can be a string or table of strings
				-- defaults to '*'
				pattern = "*.lua",
				-- you can also set `once = true` to have it only run once
				-- once = true,
			},
		},
	},
	-- autocmd example
	{
		-- event can be a string or table of strings like { 'BufWritePre', 'BufWritePost' }
		{ "FileType" },
		-- definition can be a string or a lua function
		":setlocal conceallevel=0",
		opts = {
			-- autocommand pattern to match, defaults to '*'
			pattern = { "json", "jsonc" },
			-- you can also specify group, it must be an *already existing*
			-- augroup name, unless nested inside an augroup table as above
			group = "LspFormat",
		},
	},
}
-- legendary.setup {
legendary.setup {
	-- Include builtins by default, set to false to disable
	include_builtin = true,
	-- Customize the prompt that appears on your vim.ui.select() handler
	select_prompt = "Legendary",
	-- keymaps = keymaps, -u Initial keymaps to bind
	-- commands = commands, -- Initial commands to create
	-- autocmds = autocommands -- Initial autocmds to create
	auto_register_which_key = true,
}