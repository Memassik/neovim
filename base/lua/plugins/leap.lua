return {
	"ggandor/leap.nvim",
	lazy = false,
	dependencies = { "tpope/vim-repeat" },
	config = function() end,
	keys = {
		{ "<leader>jj", "<Plug>(leap-forward)", desc = "Leap Forward" },
		{ "<leader>jk", "<Plug>(leap-backward)", desc = "Leap Backward" },
		{ "<leader>jJ", "<Plug>(leap-from-window)", desc = "Leap Out" },
	},
}
