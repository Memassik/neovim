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
		},
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
	},
}
