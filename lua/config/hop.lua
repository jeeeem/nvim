local status_ok, hop = pcall(require, "hop")

if not status_ok then
	return
end

hop.setup {
	keys = "etovxqpdygfblzhckisuran",
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Keybindings

-- Current line hop
keymap("n", "f", "<cmd>HopChar1CurrentLineAC<cr>", opts)

keymap("n", "F", "<cmd>HopChar1CurrentLineBC<cr>", opts)

keymap(
	"o",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = false })<cr>",
	opts
)

keymap(
	"o",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = false })<cr>",
	opts
)

keymap(
	"o",
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true})<cr>",
	opts
)

keymap(
	"o",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump =true })<cr>",
	opts
)

-- One-char Hop  --w with window hop
keymap("n", "gs", "<cmd>HopChar1AC<cr>", opts)
keymap("n", "gsw", "<cmd>HopChar1MW<cr>", opts)
keymap("n", "gS", "<cmd>HopChar1BC<cr>", opts)

-- Two-char Hop  --w with window hop
keymap("n", "gst", "<cmd>HopChar2AC<cr>", opts)
keymap("n", "gstw", "<cmd>HopChar2MW<cr>", opts)
keymap("n", "gsT", "<cmd>HopChar2BC<cr>", opts)

-- Line Hop  --w with window hop
keymap("n", "gsl", "<cmd>HopLineStartAC<cr>", opts)
keymap("n", "gslw", "<cmd>HopLineStartMW<cr>", opts)
keymap("n", "gsL", "<cmd>HopLineStartBC<cr>", opts)

-- Pattern Hop
keymap("n", "gs/", "<cmd>HopPatternAC<cr>", opts)
keymap("n", "gs?", "<cmd>HopPatternBC<cr>", opts)