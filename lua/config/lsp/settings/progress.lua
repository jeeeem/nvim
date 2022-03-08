local status_ok, fidget = pcall(require, "fidget")

if not status_ok then
	return
end

local opts = {}

-- fidget.setup(opts)

if not fidget.is_installed() then
	fidget.setup()
end
