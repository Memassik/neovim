return {
	"NeogitOrg/neogit",
	cmd = {
		"Neogit",
		"NeogitCommit",
		"NeogitLogCurrent",
		"NeogitResetState",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"ibhagwan/fzf-lua",
	},
	opts = {
		disable_context_highlighting = true,
	},
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
		{ "<leader>gf", "<cmd>NeogitLogCurrent<cr>", desc = "Git Current File History" },
	},
}
