local fn = vim.fn

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
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
	compile_path = require("packer.util").join_paths(vim.fn.stdpath "config", "lua", "user", "packer_compiled.lua"),
}

-- Install your plugins here
return packer.startup(function(use)
	-- Essential Plugins
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
	use "lewis6991/impatient.nvim" --Improve startup time
	use "edkolev/tmuxline.vim" -- Tmux statusline generator
	use "lukas-reineke/indent-blankline.nvim" -- Indent line
	use "antoinemadec/FixCursorHold.nvim" -- https://github.com/neovim/neovim/issues/12587
	use "stevearc/dressing.nvim" -- Improve vim.ui interfaces
	use "dstein64/vim-startuptime" -- Startup profile
	use "wakatime/vim-wakatime" -- Tracking activity
	use "ethanholz/nvim-lastplace" -- Last position of last edit

	-- General IDE Plugins
	use "windwp/nvim-autopairs" -- Auto pairs
	use "numToStr/Comment.nvim" -- Commenter
	use "norcalli/nvim-colorizer.lua" -- Color highlighter
	use "kyazdani42/nvim-tree.lua" -- File Explorer Tree
	use "kyazdani42/nvim-web-devicons" -- Devicons
	use "akinsho/toggleterm.nvim" -- Floating terminl
	use "ahmedkhalf/project.nvim" -- Workspaces/Project management
	use "rcarriga/nvim-notify" -- Notifications
	use "goolord/alpha-nvim" -- Dashboard
	use "folke/zen-mode.nvim" -- Zen mode
	use "folke/twilight.nvim" -- Dim code
	use "vim-airline/vim-airline" -- Tab/status line
	use "vim-airline/vim-airline-themes" -- Airline Themes
	use { "vim-ctrlspace/vim-ctrlspace", commit = "7ad53ecd905e22751bf3d31aef2db5f411976679" } -- Better buffer tab
	use { "michaelb/sniprun", run = "bash ./install.sh" } -- Code snippet runner
	use { "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" } -- Code Runner

	-- use {
	-- 	"kdheepak/tabline.nvim",
	-- 	requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
	-- } -- Tab/Status line
	-- use "akinsho/bufferline.nvim" -- Tab line
	-- use "moll/vim-bbye" -- Buffer deletion

	-- Utility Plugins
	use "ggandor/lightspeed.nvim" -- Motion
	use "folke/which-key.nvim" -- Popup Keybindings
	use "mrjones2014/legendary.nvim" -- Legend keymaps
	use "aserowy/tmux.nvim" -- Tmux integration to Neovim
	use "tpope/vim-surround" -- Surround text object
	use "troydm/zoomwintab.vim" -- Tmux-like zoom window
	use "christoomey/vim-tmux-navigator" -- Tmux integration to Neovim
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
	use "nvim-telescope/telescope.nvim" -- FZF
	use "nvim-telescope/telescope-fzf-native.nvim" -- FZF enhancement
	use "nvim-telescope/telescope-media-files.nvim" -- Support image file

	-- Completion Plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp" -- lsp completions
	use "hrsh7th/cmp-nvim-lua" -- lua completions
	use "folke/lua-dev.nvim" -- Completion for Nvim lua API

	-- LSP Plugins
	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use "ray-x/lsp_signature.nvim" -- LSP signature hints
	use "jose-elias-alvarez/null-ls.nvim" -- Formatters and linters
	use "folke/trouble.nvim" -- Pretty diagnostics
	use "simrat39/symbols-outline.nvim" -- Tree-like symbols
	use "b0o/schemastore.nvim" -- JSON SchemaStore
	use { "kosayoda/nvim-lightbulb", requires = "neovim/nvim-lspconfig" } -- Code Action light bulb
	use {
		"j-hui/fidget.nvim",
		requires = "neovim/nvim-lspconfig",
	} -- LSP Progress

	-- Debugging Plugins
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
	use "Pocco81/DAPInstall.nvim"
	use "theHamsta/nvim-dap-virtual-text"
	-- use "nvim-telescope/telescope-dap.nvim"

	-- Treesitter Plugins
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "p00f/nvim-ts-rainbow" -- Rainbow Parenthesis
	use "nvim-treesitter/playground" -- Treesitter Playground
	use "JoosepAlviste/nvim-ts-context-commentstring" -- Treesitter for commentstring
	use "nvim-treesitter/nvim-treesitter-refactor" -- Treesitter refactor module

	-- Git Plugins
	use "lewis6991/gitsigns.nvim" -- Git integration
	use "tpope/vim-fugitive" --  Git wrapper

	-- Snippets Plugins
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- Colorschemes Plugins
	use "folke/tokyonight.nvim"
	use "olimorris/onedarkpro.nvim"

	-- Note Taking Plugins
	use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" } --  Markdown Preview
	use "vimwiki/vimwiki"
	use "vim-pandoc/vim-pandoc-syntax"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
