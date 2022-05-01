local f_status_ok, prettyfold = pcall(require, "pretty-fold")
local p_status_ok, prettypreview = pcall(require, "pretty-fold.preview")
local k_status_ok, keymap_amend = pcall(require, "keymap-amend")
local mapping = prettypreview.mapping

if not f_status_ok then
	return
end

if not p_status_ok then
	return
end

if not k_status_ok then
	return
end

prettyfold.setup {
	config = {
		fill_char = "•",
		sections = {
			left = {
				"content",
			},
			right = {
				" ",
				"number_of_folded_lines",
				": ",
				"percentage",
				" ",
				function(config)
					return config.fill_char:rep(3)
				end,
			},
		},

		remove_fold_markers = true,

		-- Keep the indentation of the content of the fold string.
		keep_indentation = true,

		-- Possible values:
		-- "delete" : Delete all comment signs from the fold string.
		-- "spaces" : Replace all comment signs with equal number of spaces.
		-- false    : Do nothing with comment signs.
		process_comment_signs = "spaces",

		-- Comment signs additional to the value of `&commentstring` option.
		comment_signs = {},

		-- List of patterns that will be removed from content foldtext section.
		stop_words = {
			"@brief%s*", -- (for C++) Remove '@brief' and all spaces after.
		},

		add_close_pattern = true, -- true, 'last_line' or false
		matchup_patterns = {
			-- beginning of the line -> any number of spaces -> 'do' -> end of the line
			{ "^%s*do$", "end" }, -- `do ... end` blocks
			{ "^%s*if", "end" }, -- if
			{ "^%s*for", "end" }, -- for
			{ "function%s*%(", "end" }, -- 'function( or 'function (''
			{ "{", "}" },
			{ "%(", ")" }, -- % to escape lua pattern char
			{ "%[", "]" }, -- % to escape lua pattern char
		},
	},
}

prettypreview.setup {
	default_keybindings = false, -- Set to false to disable default keybindings

	-- 'none', "single", "double", "rounded", "solid", 'shadow' or table
	-- For explanation see: :help nvim_open_win()
	-- border = { " ", "", " ", " ", " ", " ", " ", " " },

	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
}

keymap_amend("n", "l", mapping.show_close_preview_open_fold)
-- keymap_amend("n", "h", mapping.close_preview_open_fold)
-- keymap_amend("n", "zo", mapping.close_preview)
-- keymap_amend("n", "zO", mapping.close_preview)
keymap_amend("n", "zc", mapping.close_preview_without_defer)
