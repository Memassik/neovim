return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	opts = {
		ensure_installed = {
			"c",
			"cpp",
			"lua",
			"luadoc",
			"vim",
			"vimdoc",
			"markdown",
			"markdown_inline",
		},
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<leader>vv",
				node_incremental = "<leader>vi",
				scope_incremental = "<leader>vs",
				node_decremental = "<leader>vd",
			},
		},
	},
}
