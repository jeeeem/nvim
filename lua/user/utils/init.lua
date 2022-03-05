local loader = require("packer").loader

-- Reload configuration without exiting vim
-- https://www.reddit.com/r/neovim/comments/puuskh/how_to_reload_my_lua_config_while_using_neovim/
-- TODO: Add more details for reloading lazy loeaded plugins (airline and telescope)
function _G.reload_nvim_conf()
	for name, _ in pairs(package.loaded) do
		if name:match "^user" then
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
