local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("P", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	-- dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("a", "  Alacritty Configuration", ":e ~/.config/alacritty/alacritty.yml <CR>"),
	dashboard.button("i", "  i3 Configuration", ":e ~/.config/i3/config <CR>"),
	dashboard.button("m", "  Mpv Configuration", ":e ~/.config/mpv/mpv.conf <CR>"),
	dashboard.button("p", "  Polybar Configuration", ":e ~/.config/polybar/config <CR>"),
	dashboard.button("v", "  Neovim Configuration", ":e ~/.nvim-lua-config/nvim/init.lua <CR>"),
	dashboard.button("z", "  Zsh Configuration", ":e ~/.zshrc <CR>"),
	dashboard.button("h", "  Hide Startup", ":Alpha<CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- local function footer()
-- 	-- NOTE: requires the fortune-mod package to work
-- 	-- local handle = io.popen("fortune")
-- 	-- local fortune = handle:read("*a")
-- 	-- handle:close()
-- 	-- return fortune
-- 	return "chrisatmachine.com"
-- end

local function footer()
	local plugins = #vim.tbl_keys(packer_plugins)
	local v = vim.version()
	-- local datetime = os.date " %d-%m-%Y   %H:%M:%S"
	local datetime = os.date " %d-%m-%Y"
	return string.format(" %s Plugins   v%s.%s.%s  %s", plugins, v.major, v.minor, v.patch, datetime)
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
