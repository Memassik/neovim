return {
	"akinsho/bufferline.nvim",
	event = "BufReadPre",
	opts = {
		options = {
			themable = true,
			offsets = {
				{ filetype = "NvimTree", highlight = "NvimTreeNormal" },
			},
		},
	},
    keys = {
		{ "gb", "<cmd>BufferLinePick<CR>", desc = "Bufferline Pick" },
    }
}
