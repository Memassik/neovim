return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		animate = { enabled = false },
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = false },
		indent = { enabled = true },
		image = { enabled = false },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		terminal = { enabled = false },
		words = { enabled = true },
	},
	config = function()
		vim.g.snacks_animate = false
	end,
}
