vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("render-markdown").setup({
	completions = { lsp = { enabled = true } },
})

require("render-markdown").disable()

local map = vim.keymap.set
map("n", "<leader>um", function()
	require("render-markdown").toggle()
end, { desc = "render-markdown" })
