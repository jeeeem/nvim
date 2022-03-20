---@diagnostic disable: lowercase-global
local loader = require("packer").loader

-- Reload configuration without exiting vim
-- https://www.reddit.com/r/neovim/comments/puuskh/how_to_reload_my_lua_config_while_using_neovim/
-- TODO: Add more details for reloading lazy loeaded plugins (airline and telescope)
function _G.reload_nvim_conf()
	for name, _ in pairs(package.loaded) do
		if name:match "^config" then
			package.loaded[name] = nil
		end
	end

	dofile(vim.env.MYVIMRC)
	-- vim.cmd [[AirlineRefresh]]
	-- loader "nvim-treesitter"
	vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

function _G.clear_debug_details()
	require("dap").clear_breakpoints()
	vim.cmd [[DapVirtualTextForceRefresh]]
end

-- Snapshot Plugins before updating
function _G.packer_update()
	local datetime = os.date "%d-%m-%Y"

	-- Delete the existing snapshot
	vim.cmd("PackerSnapshotDelete " .. datetime)

	-- Snapshot the current plugins with name of current date time
	vim.defer_fn(function()
		vim.cmd("PackerSnapshot " .. datetime)
	end, 100)

	vim.defer_fn(function()
		vim.notify "Initializing Packer Update..."
	end, 700)
	vim.cmd [[source ~/.nvim-lua-config/nvim/lua/config/plugins.lua | PackerSync]]

	-- Update the plugins
end

browser = function()
	local bookmarks = {
		"https://github.com/neovim/neovim",
		"https://neovim.discourse.group/",
		"https://github.com/nvim-telescope/telescope.nvim",
		"https://github.com/rockerBOO/awesome-neovim",
	}
	require("browse").browse { bookmarks = bookmarks }
end
