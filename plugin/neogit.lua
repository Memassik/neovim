vim.pack.add({
	"https://github.com/NeogitOrg/neogit",
	"https://github.com/sindrets/diffview.nvim",
	"https://github.com/bhagwan/fzf-lua",
})

require("neogit").setup({})

local kmap = vim.keymap
kmap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })
