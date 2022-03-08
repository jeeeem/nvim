-- local keymap = require "config.keymaps"
-- print(keymap)

local status_ok, dial = pcall(require, "dial.config")

if not status_ok then
	return
end

local augend = require "dial.augend"

dial.augends:register_group {
	default = {
		augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
		augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
		augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
		-- uppercase hex number (0x1A1A, 0xEEFE, etc.)
		augend.constant.new {
			elements = { "and", "or" },
			word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
			cyclic = true, -- "or" is incremented into "and".
		},
		augend.constant.new {
			elements = { "&&", "||" },
			word = false,
			cyclic = true,
		},
		augend.constant.new {
			elements = { "true", "false" },
			word = true,
			cyclic = true,
		},
	},
}

vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
