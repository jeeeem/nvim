local status_ok, regex = pcall(require, "regexplainer")

if not status_ok then
	return
end

regex.setup {
	-- 'narrative'
	mode = "narrative", -- TODO: 'ascii', 'graphical'

	-- automatically show the explainer when the cursor enters a regexp
	auto = false,

	-- Whether to log debug messages
	debug = false,

	-- 'split', 'popup'
	display = "split",

	mappings = {
		-- show = "gR",
		toggle = "gR",
		-- show = 'gS',
		-- hide = 'gH',
		-- showSplit = 'gP',
		-- showPopup = 'gU',
	},

	narrative = {
		separator = "\n",
	},
}
