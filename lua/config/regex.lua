local status_ok, regex = pcall(require, "regexplainer")

if not status_ok then
	return
end

regex.setup {
	-- 'narrative'
	mode = "narrative", -- TODO: 'ascii', 'graphical'

	-- automatically show the explainer when the cursor enters a regexp
	auto = false,

	-- filetypes (i.e. extensions) in which to run the autocommand
	filetypes = {
		"html",
		"js",
		"cjs",
		"mjs",
		"ts",
		"jsx",
		"tsx",
		"cjsx",
		"mjsx",
	},

	-- Whether to log debug messages
	debug = false,

	-- 'split', 'popup'
	display = "split",

	mappings = {
		toggle = "gR",
		-- show = "gR",
		-- show = 'gS',
		-- hide = 'gH',
		-- showSplit = 'gP',
		-- showPopup = 'gU',
	},

	narrative = {
		separator = "\n",
	},
}
