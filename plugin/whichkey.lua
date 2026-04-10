vim.pack.add({
	"https://github.com/folke/which-key.nvim",
})

local wk = require("which-key")

wk.setup({
	preset = "helix",
	defaults = {},
})

wk.add({
	{ "<leader>c", group = "code" },
	{ "<leader>f", group = "find" },
	{ "<leader>fg", group = "git" },
	{ "<leader>g", group = "git" },
	{ "<leader>j", hidden = true },
	{ "<leader>s", group = "search" },
	{ "<leader>st", group = "tags" },
	{ "<leader>b", group = "buffer" },
	{ "<leader>u", group = "toggle" },
	{ "<leader>x", group = "diagnostic" },
	{ "<leader>w", group = "window" },
	{ "<leader><Tab>", group = "tab" },
})
