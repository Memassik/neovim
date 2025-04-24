return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("configs.lspconfig").defaults()
		require("configs.langs.c").setup()
	end,
}
