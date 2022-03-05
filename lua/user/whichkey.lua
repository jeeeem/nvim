local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = false, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	-- ["Space"] = { "<cmd> Whichkey <cr>", "Close" },
	["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', "Comment" },
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["E"] = { "<cmd>SymbolsOutline<cr>", "Symbol Outline" },
	-- ["w"] = { "<cmd>w!<CR>", "Save" },
	-- ["q"] = { "<cmd>q!<CR>", "Quit" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	-- ["U"] = { "<cmd>source $MYVIMRC<CR>", "Update config" },
	["U"] = { "<cmd>lua reload_nvim_conf()<CR>", "Update config" },

	b = {
		name = "Buffers",
		b = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Buffers",
		},
		c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	},

	d = {
		name = "Debugging",
		b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue/Start" },
		C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
		d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		I = { "<cmd>lua require'dapui'.toggle()<cr>", "Step Into" },
		l = { "<cmd>lua require'dapui'.list_breakpoints()<cr>", "List breakpoints" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		s = { "<cmd>lua require'dap'.set_breakpoint()<cr>", "Set Breakpoint" },
		t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		-- x = { "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clear Breakpoints" },
		x = { "<cmd>lua clear_debug_details()<cr>", "Clear Breakpoints" },
	},

	f = {
		name = "Focus Mode Window",
		e = {
			"<cmd>FocusEqualise<cr>",
			"Equalize Windows",
		},
		h = {
			"<cmd>FocusSplitLeft<cr>",
			"Move to existing left window or create a new split to the left",
		},
		j = {
			"<cmd>FocusSplitDown<cr>",
			"Move to existing down window or create a new split to the down",
		},
		k = {
			"<cmd>FocusSplitUp<cr>",
			"Move to existing up indow or create a new split to the up",
		},
		l = {
			"<cmd>FocusSplitRight<cr>",
			"Move to existing right indow or create a new split to the right",
		},
		m = {
			"<cmd>FocusMaxOrEqual<cr>",
			"Toggle Maximize or Equalize the Window",
		},
		t = {
			"<cmd>FocusToggle<cr>",
			"Toggle Focus mode",
		},
	},

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>source ~/.nvim-lua-config/nvim/lua/user/plugins.lua | PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>TroubleToggle document_diagnostics<cr>",
			"Document Diagnostics",
		},
		D = {
			"<cmd>Telescope diagnostics<cr>",
			"Project Document Diagnostics",
		},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		x = { "<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<cr>", "Stop all LSP clients" },
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		f = {
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Find Files",
		},
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		p = { "<cmd>Telescope projects<cr>", "Projects" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		s = { "<cmd>lua require('legendary').find()<cr>", "Search for keymaps and commands" },
		t = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
		-- k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		-- C = { "<cmd>Telescope commands<cr>", "Commands" },
	},

	r = {
		name = "Code Runner",
		c = {
			"<cmd>RunCode<cr>",
			"Run Code based on file type",
		},
		f = {
			"<cmd>RunFile<cr>",
			"Run the current file",
		},
		F = {
			"<cmd>CRFiletype<cr>",
			"List of supported filetypes config",
		},
		p = {
			"<cmd>RunProject<cr>",
			"Run the current project",
		},
		P = {
			"<cmd>CRProjects<cr>",
			"List of projects config",
		},
	},

	t = {
		name = "Tab",
		c = { "<cmd>tabclose<cr>", "Close tab" },
		f = { "<cmd>tabfirst<cr>", "Move to first tab" },
		l = { "<cmd>tablast<cr>", "Move to last tab" },
		o = { "<cmd>tabonly<cr>", "Close other tab" },
		n = { "<cmd>tabnew<cr>", "New Tab" },
		r = { "<cmd>CtrlSpaceTabLabel<cr>", "Rename Tab" },
	},

	T = {
		name = "Terminal",
		c = { "<cmd>ToggleTerm<cr>", "Close terminal" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},

	z = {
		name = "Zen Mode",
		t = { "<cmd>Twilight<cr>", "Toggle Dim" },
		z = { "<cmd>ZenMode<cr>", "Toggle Zen Mode" },
	},
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
