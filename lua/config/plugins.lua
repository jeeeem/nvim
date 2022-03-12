local M = {}
local loader = require("packer").loader
local vi = vim.inspect

function M.remove(table, item)
	for i, value in ipairs(table) do
		if value == item then
			table[i] = nil
		end
	end
	return table
end

function M.lazy_load()
	vim.defer_fn(function()
		vim.cmd [[AirlineRefresh]]
		-- if packer_plugins["ctrlspace"].loaded == true then
		-- vim.notify "Lazy Load"
		-- vim.cmd [[AirlineRefresh]]
		-- 	loader "airline"
		-- end
	end, 5)
end

--------------------------------
local fn = vim.fn

local lazy_load_ft = {
	-- "alpha",
	"vim",
	"lua",
	"md",
	"java",
	"javascript",
	"python",
	"typescript",
	"javascriptreact",
	"typescriptreact",
	"vimwiki",
}
local dev_ft = {
	"html",
	"java",
	"javascript",
	"javascriptreact",
	"lua",
	"md",
	"python",
	"typescript",
	"typescriptreact",
	"vim",
	"vimwiki",
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
	use "mboughaba/i3config.vim" -- i3 config syntax highlighting
	use {
		"lukas-reineke/indent-blankline.nvim",
		cmd = { "IndentBlanklineRefresh" },
		config = function()
			require "config.indentline"
		end,
		-- after = "nvim-treesitter",
		opt = true,
	} -- Indent line
	use {
		"antoinemadec/FixCursorHold.nvim",
		ft = lazy_load_ft,
		opt = true,
	} -- https://github.com/neovim/neovim/issues/12587
	use "stevearc/dressing.nvim" -- Improve vim.ui interfaces
	use "dstein64/vim-startuptime" -- Startup profile
	use { "wakatime/vim-wakatime", opt = true, ft = dev_ft } -- Tracking activity
	use "ethanholz/nvim-lastplace" -- Last position of last edit
	use {
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	}

	-- General IDE Plugins
	use "windwp/nvim-autopairs" -- auto pairs
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
	use "goolord/alpha-nvim" -- Dashboard
	use "folke/zen-mode.nvim" -- Zen mode
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
	use "folke/twilight.nvim" -- Dim code
	use {
		"~/nvim-plugins/vim-ctrlspace/",
		as = "ctrlspace",
		opt = true,
		ft = dev_ft,
	} -- Better buffer tab
	use {
		"vim-airline/vim-airline",
		as = "airline",
		after = "ctrlspace",
		opt = true,
		config = function()
			vim.cmd [[Tmuxline]]
		end,
	} -- Tab/status line
	use "vim-airline/vim-airline-themes" -- Airline Themes
	use "~/nvim-plugins/nvim-web-devicons-airline" -- Web-Devicons for airline
	use { "michaelb/sniprun", opt = true, cmd = { "SnipRun" }, run = "bash ./install.sh" } -- Code snippet runner
	use { "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" } -- Code Runner

	----------------
	-- use {
	-- 	"kdheepak/tabline.nvim",
	-- 	requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
	-- } -- Tab/Status line
	-- use "akinsho/bufferline.nvim" -- Tab line
	-- use "moll/vim-bbye" -- Buffer deletion
	------------------

	-- Utility Plugins
	-- use "ggandor/lightspeed.nvim" -- Motion
	use "ThePrimeagen/harpoon" -- Better mark usage
	use "phaazon/hop.nvim" -- Easymotion
	use {
		"folke/which-key.nvim",
		opt = true,
		ft = dev_ft,
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
	use "tpope/vim-surround" -- Surround text object;
	use "troydm/zoomwintab.vim" -- Tmux-like zoom window
	use {
		"christoomey/vim-tmux-navigator",
		opt = true,
		cmd = { "TmuxNavigateUp", "TmuxNavigateDown", "TmuxNavigateLeft", "TmuxNavigateRight" },
	} -- Tmux integration to Neovim
	use "monaqa/dial.nvim" --Enchance increment/decrement
	use "tpope/vim-repeat" -- Repeatable Plugin
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

	-- FZF Plugins
	use {
		"nvim-telescope/telescope.nvim",
		opt = true,
		after = "nvim-treesitter",
		cmd = "Telescope",
	} -- FZF
	use {
		"nvim-telescope/telescope-fzf-native.nvim",
		opt = true,
		after = "telescope.nvim",
		config = "vim.cmd[[lua require('config.telescope')]]",
	} -- FZF enhancement
	use {
		"nvim-telescope/telescope-media-files.nvim", --[[ opt = true, after = "telescope.nvim" ]]
	} -- Support image file
	-- use "nvim-telescope/telescope-dap.nvim" -- Telescope extension for dap

	-- Completion Plugins
	use {
		"hrsh7th/nvim-cmp",
		ft = dev_ft,
		event = "VimEnter",
		config = "vim.cmd[[lua require('config.cmp')]]",
		opt = true,
	} -- The completion plugin
	use {
		"hrsh7th/cmp-buffer",
		after = "nvim-cmp",
		opt = true,
	} -- buffer completions
	use {
		"hrsh7th/cmp-path",
		after = "nvim-cmp",
		opt = true,
	} -- path completions
	use {
		"hrsh7th/cmp-cmdline",
		after = "nvim-cmp",
		opt = true,
	} -- cmdline completions
	use {
		"saadparwaiz1/cmp_luasnip",
		after = "nvim-cmp",
		opt = true,
	} -- snippet completions
	use {
		"hrsh7th/cmp-nvim-lsp",
		after = "nvim-cmp",
		opt = true,
	} -- LSP completions

	-- LSP Plugins
	use { "neovim/nvim-lspconfig", opt = true, ft = dev_ft, config = "vim.cmd[[lua require('config.lsp')]]" } -- enable LSP
	use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use "ray-x/lsp_signature.nvim" -- LSP signature hints
	use "jose-elias-alvarez/null-ls.nvim" -- Formatters and linters
	use "lukas-reineke/lsp-format.nvim" -- Async formatting
	use { "folke/trouble.nvim", opt = true, cmd = { "TroubleToggle" } } -- Pretty diagnostics
	use { "simrat39/symbols-outline.nvim", opt = true, cmd = { "SymbolOutline" } } -- Tree-like symbols
	use "b0o/schemastore.nvim" -- JSON SchemaStore
	use {
		"mattn/emmet-vim",
		ft = { "html", "css", "typescriptreact", "javascriptreact" },
		opt = true,
	} -- Emmet for HTML & CSS
	use { "kosayoda/nvim-lightbulb", requires = "neovim/nvim-lspconfig" } -- Code Action light bulb
	use {
		"j-hui/fidget.nvim",
		requires = "neovim/nvim-lspconfig",
	} -- LSP Progress

	-- Debugging Plugins
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } } -- Debugger
	use "Pocco81/DAPInstall.nvim" -- Debug Adapter Protoocal Installer
	use "theHamsta/nvim-dap-virtual-text" -- Virtual Text for nvim-dap
	use "mfussenegger/nvim-dap-python" -- Python extension for Nvim-dap
	-- use "mfussenegger/nvim-jdtls"

	-- Treesitter Plugins
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		opt = true,
		event = { "User TelescopePreviewerLoaded" },
		ft = lazy_load_ft,
		config = "vim.cmd[[lua require('config.treesitter')]]",
	}
	use { "nvim-treesitter/playground", opt = true, after = "nvim-treesitter" } -- Treesitter Playground
	use { "JoosepAlviste/nvim-ts-context-commentstring", opt = true, after = "nvim-treesitter" } -- Treesitter for commentstring
	use { "nvim-treesitter/nvim-treesitter-refactor", opt = true, after = "nvim-treesitter" } -- Treesitter refactor module
	use { "p00f/nvim-ts-rainbow", opt = true, after = "nvim-treesitter" } -- Rainbow Parenthesis
	use { "windwp/nvim-ts-autotag", opt = true, after = "nvim-treesitter" } -- Auto close tag

	-- Git Plugins
	use {
		"lewis6991/gitsigns.nvim", --[[ commit = "06aefb1867687ee2b1d206fd5d19a2b254c62f2c"  ]]
	} -- Git integration
	use { "tpope/vim-fugitive", opt = true, cmd = { "G" } } --  Git wrapper
	-- use "ruifm/gitlinker.nvim" -- Generate permalinks for git web front-end
	-- use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' } -- Git diff

	-- Snippets Plugins
	use {
		"L3MON4D3/LuaSnip",
		ft = dev_ft,
		opt = true,
	} --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- Colorschemes Plugins
	use {
		"folke/tokyonight.nvim",
		-- opt = true,
		-- event = "VimEnter",
		-- setup = function()
		-- 	require "config.packer_compiled"
		-- end,
	}
	use "olimorris/onedarkpro.nvim"

	-- Note Taking Plugins
	use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" } --  Markdown Preview
	use { "vimwiki/vimwiki", opt = true, cmd = { "VimwikiIndex" } }
	use "vim-pandoc/vim-pandoc-syntax"

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
