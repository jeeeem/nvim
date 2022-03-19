local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup {
	-- Animation style (see below for details)
	-- stages = "fade",
	stages = "static", -- much better for quickier dissapearance

	-- Function called when a new window is opened, use for changing win settings/config
	on_open = nil,

	-- Function called when a window is closed
	on_close = nil,

	-- Render function for notifications. See notify-render()
	render = "default",

	-- Default timeout for notifications
	timeout = 1500,

	-- Max number of columns for messages
	max_width = nil,
	-- Max number of lines for a message
	max_height = nil,

	-- For stages that change opacity this is treated as the highlight behind the window
	-- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
	background_colour = "Normal",

	-- Minimum width for notification windows
	minimum_width = 30,

	-- Icons for the different levels
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
}

vim.notify = require "notify"

-- local plugin = "My Awesome Plugin"
--
-- vim.notify("This is an error message.\nSomething went wrong!", "error", {
-- 	title = plugin,
-- 	on_open = function()
-- 		vim.notify("Attempting recovery.", vim.lsp.log_levels.WARN, {
-- 			title = plugin,
-- 		})
-- 		local timer = vim.loop.new_timer()
-- 		timer:start(2000, 0, function()
-- 			vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
-- 				title = plugin,
-- 				timeout = 3000,
-- 				on_close = function()
-- 					vim.notify("Problem solved", nil, { title = plugin })
-- 					vim.notify("Error code 0x0395AF", 1, { title = plugin })
-- 				end,
-- 			})
-- 		end)
-- 	end,
-- })
