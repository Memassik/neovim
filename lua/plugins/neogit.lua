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
		"ibhagwan/fzf-lua", -- optional
	},
	opts = {
		disable_context_highlighting = true,
		disable_insert_on_commit = true,
		process_spinner = true,
	},
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
		{ "<leader>gf", "<cmd>NeogitLogCurrent<cr>", desc = "Git Current File History" },
	},
}
