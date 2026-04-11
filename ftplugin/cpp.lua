vim.treesitter.start()
require("conform").formatters_by_ft.cpp = { "clang-format" }
vim.lsp.config["clangd"] = {
	cmd = {
		"clangd",
		"--background-index",
		"-j=8",
		"--clang-tidy",
		"--cross-file-rename",
		"--header-insertion=never",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=gnu",
	},
}
