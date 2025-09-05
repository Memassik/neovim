return {
	"akinsho/bufferline.nvim",
    event = "VimEnter",
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
