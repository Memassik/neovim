return {
	"MeanderingProgrammer/render-markdown.nvim",
	cmd = { "RenderMarkdown" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		completions = { lsp = { enabled = true } },
	},
}
