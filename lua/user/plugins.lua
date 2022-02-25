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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

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
}

-- Install your plugins here
return packer.startup(function(use)
	-- Essential Plugins
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
	use "lewis6991/impatient.nvim" --Improve startup time
	use "tpope/vim-repeat" -- Repeatable Plugin
	use "aserowy/tmux.nvim" -- Tmux integration to Neovim
	use "christoomey/vim-tmux-navigator" -- Tmux integration to Neovim
	use "edkolev/tmuxline.vim" -- Tmux statusline generator
	use "lukas-reineke/indent-blankline.nvim" -- Indent line

	-- General Plugins
	use "dstein64/vim-startuptime" -- Startup profile
	use "windwp/nvim-autopairs" -- Auto pairs
	use "numToStr/Comment.nvim" -- Commenter
	use "kyazdani42/nvim-tree.lua" -- File Explorer Tree
	use "kyazdani42/nvim-web-devicons" -- Devicons
	use "nvim-telescope/telescope.nvim" -- FZF
	use "nvim-telescope/telescope-media-files.nvim"
	use "vim-airline/vim-airline" -- Tab line
	use "vim-airline/vim-airline-themes" -- Airline Themes
	use "vim-ctrlspace/vim-ctrlspace" -- Better buffer tab
	use "akinsho/toggleterm.nvim" -- Floating terminl
	use "ahmedkhalf/project.nvim" -- Workspaces/Project management
	use "rcarriga/nvim-notify" -- Notifications
	use "goolord/alpha-nvim" -- Dashboard
	use "folke/which-key.nvim" -- Popup Keybindings

	-- use "akinsho/bufferline.nvim" -- Tab line
	-- use "moll/vim-bbye" -- Buffer deletion

	-- Completion Plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp" -- lsp completions
	use "hrsh7th/cmp-nvim-lua" -- lua completions

	-- LSP Plugins
	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use "jose-elias-alvarez/null-ls.nvim" -- Formatters and linters
	use "folke/trouble.nvim" -- Pretty diagnostics
	use "b0o/schemastore.nvim" -- JSON SchemaStore

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "p00f/nvim-ts-rainbow" -- Rainbow Parenthesis
	use "nvim-treesitter/playground" -- Treesitter Playground
	use "JoosepAlviste/nvim-ts-context-commentstring" -- Treesitter for commentstring

	-- Git
	use "lewis6991/gitsigns.nvim" -- Git integration
	use "tpope/vim-fugitive" --  Git wrapper

	-- Snippets Plugins
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- Colorschemes
	use "folke/tokyonight.nvim"

	-- Note Taking
	use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" } --  Markdown Preview
	use "vimwiki/vimwiki"
	use "vim-pandoc/vim-pandoc-syntax"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
