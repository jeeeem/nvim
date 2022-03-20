local status_ok, code_runner = pcall(require, "code_runner")

if not status_ok then
	return
end

-- Plugin Variables
--[[
$file -- file path to currend file opened
$fileName -- file name to curren file opened
$fileNameWithoutExt -- file without extension file opened
$dir -- path of directory to file opened
]]

code_runner.setup {
	term = {
		mode = "startinsert",
		tab = false,
		position = "belowright",
		size = 12,
	},
	-- If you want to use path than the pure lua config, you must use the absolute path to the JSON file configuration
	filetype_path = vim.fn.expand "~/.nvim-lua-config/nvim/lua/config/compiler/code_runner.json",
	filetype = {},
	project_path = vim.fn.expand "~/.nvim-lua-config/nvim/lua/config/compiler/project_manager.json",
	project = {},
}