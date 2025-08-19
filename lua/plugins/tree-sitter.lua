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
			enable = function()
				return true
			end,
			disable = function(lang, bufnr)
				return vim.api.nvim_buf_line_count(bufnr) > 10000
			end,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = false },
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
