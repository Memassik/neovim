return {
	"dhananjaylatkar/cscope_maps.nvim",
	lazy = true,
	cmd = { "Cs", "Cscope", "Cstag", "CsStackView", "CsPrompt" },
	dependencies = {
		"ibhagwan/fzf-lua", -- optional [for picker="fzf-lua"]
	},
	opts = {
		prefix = "<leader>cc", -- prefix to trigger maps
	},
}
