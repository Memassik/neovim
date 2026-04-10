vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/ibhagwan/fzf-lua",
})

require("fzf-lua").setup({ "ivy", fzf_colors = true })

local map = vim.keymap.set
map("n", "<leader>,", "<cmd>FzfLua buffers sort_lastused=true<cr>", { desc = "Switch Buffer" })
map("n", "<leader>/", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Switch Buffer" })
map("n", "<leader><space>", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
-- find
map("n", "<leader>fb", "<cmd>FzfLua buffers sort_lastused=true<cr>", { desc = "Buffers" })
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
map("n", "<leader>fgf", "<cmd>FzfLua git_files<cr>", { desc = "Find Files (git-files)" })
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent" })
-- git
map("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "Commits" })
map("n", "<leader>g/", "<cmd>FzfLua git_bcommits<CR>", { desc = "Current Buffer Commits" })
map("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "Status" })
map("n", "<leader>gb", "<cmd>FzfLua git_blame<CR>", { desc = "BLAME!" })

-- search
map("n", "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", { desc = "Document Diagnostics" })
map("n", "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "Workspace Diagnostics" })
map("n", "<leader>sg", "<cmd>FzfLua live_grep_native<cr>", { desc = "Grep" })
map("n", "<leader>sh", "<cmd>FzfLua helptags<cr>", { desc = "Help Pages" })
map("n", "<leader>sH", "<cmd>FzfLua highlights<cr>", { desc = "Search Highlight Groups" })
map("n", "<leader>sj", "<cmd>FzfLua jumps<cr>", { desc = "Jumplist" })
map("n", "<leader>sk", "<cmd>FzfLua keymaps<cr>", { desc = "Key Maps" })
map("n", "<leader>sl", "<cmd>FzfLua loclist<cr>", { desc = "Location List" })
map("n", "<leader>sm", "<cmd>FzfLua manpages<cr>", { desc = "Man Pages" })
map("n", "<leader>sM", "<cmd>FzfLua marks<cr>", { desc = "Jump to Mark" })
map("n", "<leader>sR", "<cmd>FzfLua resume<cr>", { desc = "Resume" })
map("n", "<leader>sq", "<cmd>FzfLua quickfix<cr>", { desc = "Quickfix List" })
map("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", { desc = "Word" })
map("v", "<leader>sw", "<cmd>FzfLua grep_visual<cr>", { desc = "Selection" })
map("n", "<leader>stt", "<cmd>FzfLua tags<cr>", { desc = "Tags" })
map("n", "<leader>stg", "<cmd>FzfLua tags_live_grep<cr>", { desc = "Grep Tags" })
map("n", "<leader>stw", "<cmd>FzfLua tags_grep_cword<cr>", { desc = "Tag" })
map("v", "<leader>stw", "<cmd>FzfLua tags_grep_visual<cr>", { desc = "Selection Tags" })
map("n", "<leader>ss", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "Goto Symbol" })
map("n", "<leader>sS", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", { desc = "Goto Symbol (Workspace)" })
