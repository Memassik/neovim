vim.pack.add({
	"https://github.com/folke/which-key.nvim",
})

local wk = require("which-key")

wk.setup({
	preset = "helix",
	defaults = {},
})

wk.add({
	{ "<leader><Tab>", group = "tab" },
	{ "<leader>b", group = "buffer" },
	{ "<leader>c", group = "code" },
	{ "<leader>f", group = "find" },
	{ "<leader>fg", group = "git" },
	{ "<leader>g", group = "git" },
	{ "gr", group = "lsp" },
	{ "<leader>j", hidden = true },
	{ "<leader>s", group = "search" },
	{ "<leader>st", group = "tags" },
	{ "<leader>u", group = "toggle" },
	{ "<leader>w", group = "window" },
	{ "<leader>x", group = "diagnostic" },
})
