vim.pack.add({
	"https://github.com/folke/flash.nvim",
})

local map = vim.keymap.set
map({ "n", "x", "o" }, "<leader>jj", function()
	require("flash").jump()
end, { desc = "Flash" })

map({ "n", "x", "o" }, "<leader>jJ", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

map({ "x", "o" }, "<leader>jk", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
