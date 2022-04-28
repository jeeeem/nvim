-- local M = {}
-- local loader = require("packer").loader
-- local vi = vim.inspect
--
-- function M.remove(table, item)
-- 	for i, value in ipairs(table) do
-- 		if value == item then
-- 			table[i] = nil
-- 		end
-- 	end
-- 	return table
-- end
--
-- function M.lazy_load()
-- 	vim.defer_fn(function()
-- 		vim.cmd [[AirlineRefresh]]
-- 		-- if packer_plugins["ctrlspace"].loaded == true then
-- 		-- vim.notify "Lazy Load"
-- 		-- vim.cmd [[AirlineRefresh]]
-- 		-- 	loader "airline"
-- 		-- end
-- 	end, 5)
-- end

--------------------------------
local fn = vim.fn

local dev_ft = {
	"bash",
	"css",
	"elixir",
	"go",
	"html",
	"java",
	"javascript",
	"javascriptreact",
	"json",
	"just",
	"lua",
	"markdown.pandoc",
	"md",
	"python",
	"sh",
	"toml",
	"typescript",
	"typescriptreact",
	"vim",
	"vimwiki",
	"yaml",
}

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify "Packer Configuration Error"
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		non_interactive = false,
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
	compile_path = require("packer.util").join_paths(vim.fn.stdpath "config", "lua", "config", "packer_compiled.lua"),
	profile = {
		enable = false,
		threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
	},
}

-- Install your plugins here
return packer.startup(function(use)
	-- Essential Plugins
	use { "wbthomason/packer.nvim" } -- Have packer manage itself
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
	use "lewis6991/impatient.nvim" --Improve startup time
	use "nathom/filetype.nvim" -- Improve startup time
	use "edkolev/tmuxline.vim" -- Tmux statusline generator
	use "duggiefresh/vim-easydir" -- Create nested file/dir using :e / :new
	use "mbbill/undotree" -- Undo history
	use "mboughaba/i3config.vim" -- i3 config syntax highlighting
	use "NoahTheDuke/vim-just" -- justfile syntax highlighting
	use {
		"lukas-reineke/indent-blankline.nvim",
		cmd = { "IndentBlanklineRefresh" },
		-- ft = dev_ft,
		config = function()
			require "config.indentline"
			-- vim.cmd [[IndentBlanklineRefresh]]
		end,
		after = "nvim-treesitter",
	} -- Indent line
	use {
		"antoinemadec/FixCursorHold.nvim",
		ft = dev_ft,
	} -- https://github.com/neovim/neovim/issues/12587
	use "stevearc/dressing.nvim" -- Improve vim.ui interfaces
	use "dstein64/vim-startuptime" -- Startup profile
	-- use "tweekmonster/startuptime.vim" -- Startup profile
	use { "wakatime/vim-wakatime", opt = true, ft = dev_ft } -- Tracking activity
	-- use {
	-- 	"andweeb/presence.nvim",
	-- 	config = function()
	-- 		require("pressence").setup()
	-- 	end,
	-- }
	use "ethanholz/nvim-lastplace" -- Last position of last edit
	use {
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	}

	-- General IDE Plugins
	-- use "jedrzejboczar/possession.nvim" -- Session management
	-- use {
	-- 	"rmagatti/auto-session",
	-- 	config = function()
	-- 		require "config.session"
	-- 	end,
	-- } -- Auto Session
	use {
		"bennypowers/nvim-regexplainer",
		config = function()
			require("regexplainer").setup()
		end,
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	} --Regex explainer
	use {
		"~/nvim-plugins/vim-ctrlspace/",
		as = "ctrlspace",
		opt = true,
		ft = dev_ft,
		cmd = "CtrlSpace",
	} -- Better buffer tab
	use {
		"vim-airline/vim-airline",
		as = "airline",
		after = "ctrlspace",
		opt = true,
		config = function()
			-- Check if tmux is in session
			local tmux_socket = vim.fn.split(vim.env.TMUX, ",")[1]
			if tmux_socket == "null" then
				return
			else
				vim.cmd [[Tmuxline]]
			end
		end,
	} -- Tab/status line
	use { "goolord/alpha-nvim", config = "vim.cmd[[set laststatus=0]]" } -- Dashboard
	use { "mg979/vim-visual-multi", ft = dev_ft } -- Multiple cursors
	use { "michaelb/sniprun", opt = true, cmd = { "SnipRun" }, run = "bash ./install.sh" } -- Code snippet runner
	use { "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" } -- Code Runner
	use "vim-airline/vim-airline-themes" -- Airline Themes
	use "~/nvim-plugins/nvim-web-devicons-airline" -- Web-Devicons for airline
	use "windwp/nvim-autopairs" -- Auto pairs
	use "numToStr/Comment.nvim" -- Commenter
	use "norcalli/nvim-colorizer.lua" -- Color highlighter
	use "nvim-pack/nvim-spectre" -- Better search and replace
	use "anuvyklack/pretty-fold.nvim" -- Better folding text
	use "beauwilliams/focus.nvim" -- Better window management
	use "kyazdani42/nvim-tree.lua" -- File Explorer Tree
	use "kyazdani42/nvim-web-devicons" -- Devicons
	use "akinsho/toggleterm.nvim" -- Floating terminl
	use "ahmedkhalf/project.nvim" -- Workspaces/Project management
	use "rcarriga/nvim-notify" -- Notifications
	use "ThePrimeagen/refactoring.nvim" -- Refactoring Library
	use "folke/zen-mode.nvim" -- Zen mode
	use "folke/twilight.nvim" -- Dim code

	-- Utility Plugins
	-- use "rafcamlet/nvim-luapad" -- Lua Scratchpad
	-- use "mrjones2014/smart-splits.nvim" -- Smart resizing
	-- use "chrisbra/unicode.vim" -- Unicode glyphs
	use {
		"sQVe/sort.nvim",
		config = function()
			require("sort").setup {}
		end,
	} -- Sorting
	use {
		"ThePrimeagen/harpoon",
		ft = dev_ft,
		callback = function()
			requires "config.harpoon"
		end,
	} -- Better mark usage
	use {
		"folke/which-key.nvim",
		config = function()
			require "config.whichkey"
		end,
	} -- Popup Keybindings
	use {
		"mrjones2014/legendary.nvim",
		opt = true,
		config = function()
			require "config.legendary"
		end,
		ft = dev_ft, --[[ commit = "f30c658f4d97e28a535fa026a8dc0d58fa121183"  ]]
	} -- Legend keymaps
	use {
		"chentau/marks.nvim",
		config = function()
			require("marks").setup {
				default_mappings = true,
			}
		end,
	} -- Better marks experience
	use {
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup {
				default_mappings = true,
			}
		end,
	} -- Preview definitions
	use {
		"christoomey/vim-tmux-navigator",
		cmd = { "TmuxNavigateUp", "TmuxNavigateDown", "TmuxNavigateLeft", "TmuxNavigateRight" },
	} -- Tmux integration to Neovim
	use "tpope/vim-surround" -- Surround text object
	use "tommcdo/vim-exchange" -- Swap text
	use "metakirby5/codi.vim" -- Scratchpad
	use "lalitmee/browse.nvim" -- Open browser
	use "phaazon/hop.nvim" -- Easymotion
	use "troydm/zoomwintab.vim" -- Tmux-like zoom window
	use "monaqa/dial.nvim" --Enchance increment/decrement
	use "tpope/vim-repeat" -- Repeatable Plugin

	-- FZF Plugins
	use {
		"ibhagwan/fzf-lua",
		config = function()
			local tnoremap = function(lhs, rhs)
				vim.api.nvim_buf_set_keymap(0, "t", lhs, rhs, { silent = true, noremap = true })
			end
			require("fzf-lua").setup {
				winopts = {
					window_on_create = function()
						tnoremap("<c-j>", "<down>")
						tnoremap("<c-k>", "<up>")
					end,
				},
			}
		end,
	} -- FZF
	use {
		"nvim-telescope/telescope.nvim",
		after = "nvim-treesitter",
		cmd = "Telescope",
	} -- Pretty fzf
	use {
		"nvim-telescope/telescope-fzf-native.nvim",
		after = "telescope.nvim",
		run = "make",
		config = function()
			require "config.telescope"
		end,
	} -- FZF enhancement
	use {
		"nvim-telescope/telescope-media-files.nvim", --[[ opt = true, after = "telescope.nvim" ]]
	} -- Support image file
	-- use "nvim-telescope/telescope-dap.nvim" -- Telescope extension for dap

	-- Completion Plugins
	use {
		"hrsh7th/nvim-cmp", -- completion plugin
		ft = dev_ft,
		config = function()
			require "config.cmp"
		end,
		-- commit = "3192a0c57837c1ec5bf298e4f3ec984c7d2d60c0",
	}

	use {
		"hrsh7th/cmp-buffer",
		after = "nvim-cmp",
	} -- buffer completions
	use {
		"hrsh7th/cmp-path",
		after = "nvim-cmp",
	} -- path completions
	use {
		"hrsh7th/cmp-cmdline",
		after = "nvim-cmp",
	} -- cmdline completions
	use {
		"saadparwaiz1/cmp_luasnip",
		after = "nvim-cmp",
	} -- snippet completions
	use {
		"hrsh7th/cmp-nvim-lsp",
		after = "nvim-cmp",
	} -- LSP completions
	use {
		"f3fora/cmp-spell",
		after = "nvim-cmp",
	} -- Spell completions

	-- LSP Plugins
	-- use "stevearc/aerial.nvim"
	use {
		"simrat39/symbols-outline.nvim",
		opt = true,
		cmd = { "SymbolsOutline" },
		config = function()
			require "config.symbols"
		end,
	} -- Tree-like symbols
	use {
		"neovim/nvim-lspconfig",
		ft = dev_ft,
		config = function()
			require "config.lsp"
		end,
	} -- enable LSP
	use {
		"mattn/emmet-vim",
		ft = { "html", "css", "typescriptreact", "javascriptreact" },
	} -- Emmet for HTML & CSS
	use {
		"j-hui/fidget.nvim",
		requires = "neovim/nvim-lspconfig",
	} -- LSP Progress
	use { "folke/trouble.nvim", cmd = { "TroubleToggle" } } -- Pretty diagnostics
	use { "kosayoda/nvim-lightbulb", requires = "neovim/nvim-lspconfig" } -- Code Action light bulb
	use { "mfussenegger/nvim-jdtls", ft = { "java" } } -- Java LSP
	use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use "ray-x/lsp_signature.nvim" -- LSP signature hints
	use "jose-elias-alvarez/null-ls.nvim" -- Formatters and linters
	use "lukas-reineke/lsp-format.nvim" -- Async formatting
	use "b0o/schemastore.nvim" -- JSON SchemaStore

	-- Debugging Plugins
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } } -- Debugger
	use "Pocco81/DAPInstall.nvim" -- Debug Adapter Protoocal Installer
	use "theHamsta/nvim-dap-virtual-text" -- Virtual Text for nvim-dap
	use "mfussenegger/nvim-dap-python" -- Python extension for Nvim-dap

	-- Treesitter Plugins
	use {
		"nvim-treesitter/nvim-treesitter", -- Treesitter
		run = ":TSUpdate",
		ft = dev_ft,
		event = { "User TelescopePreviewerLoaded" },
		config = function()
			require "config.treesitter"
		end,
	}
	use {
		"m-demare/hlargs.nvim", -- Syntax highlight for argument's definitions
		after = "nvim-treesitter",
		config = function()
			require("hlargs").setup()
		end,
	}
	use { "nvim-treesitter/playground", opt = true, after = "nvim-treesitter" } -- Treesitter Playground
	use { "JoosepAlviste/nvim-ts-context-commentstring", opt = true, after = "nvim-treesitter" } -- Treesitter for commentstring
	use { "nvim-treesitter/nvim-treesitter-refactor", opt = true, after = "nvim-treesitter" } -- Treesitter refactor
	use { "nvim-treesitter/nvim-treesitter-textobjects", opt = true, after = "nvim-treesitter" } -- Treesitter text-objects
	use { "p00f/nvim-ts-rainbow", opt = true, after = "nvim-treesitter" } -- Rainbow Parenthesis
	use { "windwp/nvim-ts-autotag", opt = true, after = "nvim-treesitter" } -- Auto close tag

	-- Git Plugins
	use {
		"lewis6991/gitsigns.nvim",
		--commit = "06aefb1867687ee2b1d206fd5d19a2b254c62f2c"
	} -- Git integration
	use { "tpope/vim-fugitive", opt = true, cmd = { "G" } } --  Git wrapper
	use {
		"ruifm/gitlinker.nvim",
		config = function()
			require("gitlinker").setup {
				-- default mapping to call url generation with action_callback
				-- mappings = "<leader>gy",
				mappings = nil,
			}
		end,
	} -- Generate permalinks for git web front-end
	-- use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' } -- Git diff

	-- Snippets Plugins
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
	use {
		"L3MON4D3/LuaSnip",
		ft = dev_ft,
		opt = true,
		config = function()
			require "config.luasnip"
		end,
	} --snippet engine

	-- Colorschemes Plugins
	use "folke/tokyonight.nvim"
	use "rebelot/kanagawa.nvim"
	use "olimorris/onedarkpro.nvim"
	use "dracula/vim"
	use "mvpopuk/inspired-github.vim"
	-- use "Mofiqul/dracula.nvim"

	-- Note Taking Plugins
	use { "vimwiki/vimwiki", opt = true, cmd = { "VimwikiIndex" } }
	use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" } --  Markdown Preview
	use "vim-pandoc/vim-pandoc-syntax"
	-- use {
	-- 	"nvim-neorg/neorg",
	-- 	-- tag = "latest",
	-- 	ft = "norg",
	-- 	after = "nvim-treesitter", -- You may want to specify Telescope here as well
	-- 	-- config = function()
	-- 	-- 	require("neorg").setup {
	-- 	-- 		...,
	-- 	-- 	}
	-- 	-- end,
	-- }

	--  For Lua Development Plugin
	-- https://github.com/ellisonleao/nvim-plugin-template
	use "milisims/nvim-luaref" --  Manpage for 5.1 Lua reference manual
	use "folke/lua-dev.nvim" -- Completion for Nvim lua API
	use {
		"hrsh7th/cmp-nvim-lua",
		ft = dev_ft,
		opt = true,
	} -- Neovim Lua completions

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
