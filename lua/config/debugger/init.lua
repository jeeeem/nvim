local status_ok, dap = pcall(require, "dap")

if not status_ok then
	return
end

local opts = {
	active = true,
	on_config_done = nil,
	breakpoint = {
		text = "",
		texthl = "LspDiagnosticsSignError",
		linehl = "",
		numhl = "",
	},
	breakpoint_rejected = {
		text = "",
		texthl = "LspDiagnosticsSignHint",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = "",
		texthl = "LspDiagnosticsSignInformation",
		linehl = "DiagnosticUnderlineInfo",
		numhl = "LspDiagnosticsSignInformation",
	},
}

vim.fn.sign_define("DapBreakpoint", opts.breakpoint)
vim.fn.sign_define("DapBreakpointRejected", opts.breakpoint_rejected)
vim.fn.sign_define("DapStopped", opts.stopped)

dap.defaults.fallback.terminal_win_cmd = nil

-- dap.adapters.python = {
-- 	type = "executable",
-- 	command = "~/.virtualenvs/debugpy/bin/python",
-- 	args = { "-m", "debugpy.adapter" },
-- }
--
-- dap.configurations.python = {
-- 	{
-- 		type = "python",
-- 		request = "launch",
-- 		name = "Python debugger",
-- 		program = "${file}",
-- 		-- redirectOutput = true,
-- 		pythonPath = function()
-- 			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
-- 			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
-- 			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
-- 			local cwd = vim.fn.getcwd()
-- 			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
-- 				return cwd .. "/venv/bin/python"
-- 			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
-- 				return cwd .. "/.venv/bin/python"
-- 			else
-- 				return "~/.virtualenvs/debugpy/bin/python"
-- 			end
-- 		end,
-- 	},
-- }

require("dap-python").setup "~/.virtualenvs/debugpy/bin/python"

table.insert(require("dap").configurations.python, {
	type = "python",
	request = "launch",
	name = "Python debugger",
	program = "${file}",
	redirectOutput = true,
})

local dapui = require "config.debugger.dap-ui"

dap.listeners.after.event_initialized["dapui"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui"] = function()
	dapui.close()
end
