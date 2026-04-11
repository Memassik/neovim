vim.pack.add({
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/Saghen/blink.cmp",
	"https://github.com/neovim/nvim-lspconfig",
})

require("fidget").setup()

vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	-- signs = {
	-- 	text = {
	-- 		[vim.diagnostic.severity.ERROR] = "E ",
	-- 		[vim.diagnostic.severity.WARN] = "W ",
	-- 		[vim.diagnostic.severity.INFO] = "I ",
	-- 		[vim.diagnostic.severity.HINT] = "H ",
	-- 	},
	-- },

	virtual_text = false and {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})
