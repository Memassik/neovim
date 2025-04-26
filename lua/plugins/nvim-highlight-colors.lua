return {
	"brenoprata10/nvim-highlight-colors",
	cmd = { "HighlightColors" },
	opts = {},
	keys = {
		{
			"<leader>uh",
			"<cmd>HighlightColors On<cr>",
			desc = "Highlights On",
		},
		{
			"<leader>uH",
			"<cmd>HighlightColors Off<cr>",
			desc = "Highlights Off",
		},
	},
}
