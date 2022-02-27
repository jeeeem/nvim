local z_status_ok, zen = pcall(require, "zen-mode")

if not z_status_ok then
	return
end

local t_status_ok, twilight = pcall(require, "twilight")

if not t_status_ok then
	return
end

-- Zen Settings
zen.setup {
	window = {
		options = {
			number = false,
			relativenumber = false,
		},
	},
}

-- Twilight Settings
twilight.setup {
	treesitter = true,
}
