vim.pack.add({
	"https://github.com/akinsho/bufferline.nvim",
})

require("bufferline").setup({
	options = {
		themable = true,
		offsets = {
			{ filetype = "NvimTree", highlight = "NvimTreeNormal" },
		},
	},
})

local map = vim.keymap.set
map("n", "gb", "<cmd>BufferLinePick<cr>", { desc = "Bufferline Pick" })
