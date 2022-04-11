-- local status_ok, possession = pcall(require, "possession")
--
-- if not status_ok then
-- 	return
-- end
--
-- possession.setup {
-- 	commands = {
-- 		save = "SSave",
-- 		show = "SShow",
-- 		load = "SLoad",
-- 		delete = "SDelete",
-- 		list = "SList",
-- 	},
-- }

local status_ok, auto_session = pcall(require, "auto-session")

if not status_ok then
	return
end

local opts = {
	log_level = "info",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = nil,
	auto_restore_enabled = false,
	auto_session_suppress_dirs = nil,
	-- the configs below are lua only
	bypass_session_save_file_types = nil,
}

auto_session.setup(opts)
