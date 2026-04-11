require("nvim-treesitter").install({
	"rust",
})
vim.treesitter.start()
require("conform").formatters_by_ft.rust = { "rustfmt" }
