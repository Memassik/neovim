vim.api.nvim_create_augroup("langs", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "langs",
	pattern = { "c", "cpp" },
	callback = function()
		require("configs.langs.c").setup()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = "langs",
	pattern = { "rust" },
	callback = function()
		require("configs.langs.rust").setup()
	end,
})
