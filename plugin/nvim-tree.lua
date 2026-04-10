vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-tree/nvim-tree.lua",
})

require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 35,
	},
	renderer = {
		highlight_git = true,
		group_empty = true,
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "U",
					staged = "S",
					unmerged = "UM",
					renamed = "R",
					deleted = "D",
					untracked = "X",
					ignored = "I",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
	filters = {
		dotfiles = true,
	},
})

local map = vim.keymap.set
map("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "NvimTree: toggle" })
