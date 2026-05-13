vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/ibhagwan/fzf-lua",
})

require("fzf-lua").setup({
	"ivy",
	fzf_colors = true,
	previewers = {
		builtin = {
			treesitter = {
				limit_b = 1024 * 1024 * 5,
				disabled = { "markdown" },
			},
		},
	},
})

local kmap = vim.keymap
kmap.set("n", "<leader>,", "<cmd>FzfLua buffers sort_lastused=true<cr>", { desc = "Switch Buffer" })
kmap.set("n", "<leader>/", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Switch Buffer" })
kmap.set("n", "<leader><space>", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
-- find
kmap.set("n", "<leader>fb", "<cmd>FzfLua buffers sort_lastused=true<cr>", { desc = "Buffers" })
kmap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
kmap.set("n", "<leader>fgf", "<cmd>FzfLua git_files<cr>", { desc = "Find Files (git-files)" })
kmap.set("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent" })
-- git
kmap.set("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "Commits" })
kmap.set("n", "<leader>g/", "<cmd>FzfLua git_bcommits<CR>", { desc = "Current Buffer Commits" })
kmap.set("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "Status" })
kmap.set("n", "<leader>gb", "<cmd>FzfLua git_blame<CR>", { desc = "BLAME!" })

-- search
kmap.set("n", "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", { desc = "Document Diagnostics" })
kmap.set("n", "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "Workspace Diagnostics" })
kmap.set("n", "<leader>sg", "<cmd>FzfLua live_grep_native<cr>", { desc = "Grep" })
kmap.set("n", "<leader>sh", "<cmd>FzfLua helptags<cr>", { desc = "Help Pages" })
kmap.set("n", "<leader>sH", "<cmd>FzfLua highlights<cr>", { desc = "Search Highlight Groups" })
kmap.set("n", "<leader>sj", "<cmd>FzfLua jumps<cr>", { desc = "Jumplist" })
kmap.set("n", "<leader>sk", "<cmd>FzfLua keymaps<cr>", { desc = "Key Maps" })
kmap.set("n", "<leader>sl", "<cmd>FzfLua loclist<cr>", { desc = "Location List" })
kmap.set("n", "<leader>sm", "<cmd>FzfLua manpages<cr>", { desc = "Man Pages" })
kmap.set("n", "<leader>sM", "<cmd>FzfLua marks<cr>", { desc = "Jump to Mark" })
kmap.set("n", "<leader>sR", "<cmd>FzfLua resume<cr>", { desc = "Resume" })
kmap.set("n", "<leader>sq", "<cmd>FzfLua quickfix<cr>", { desc = "Quickfix List" })
kmap.set("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", { desc = "Word" })
kmap.set("v", "<leader>sw", "<cmd>FzfLua grep_visual<cr>", { desc = "Selection" })
kmap.set("n", "<leader>stt", "<cmd>FzfLua tags<cr>", { desc = "Tags" })
kmap.set("n", "<leader>stg", "<cmd>FzfLua tags_live_grep<cr>", { desc = "Grep Tags" })
kmap.set("n", "<leader>stw", "<cmd>FzfLua tags_grep_cword<cr>", { desc = "Tag" })
kmap.set("v", "<leader>stw", "<cmd>FzfLua tags_grep_visual<cr>", { desc = "Selection Tags" })
kmap.set("n", "<leader>ss", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "Goto Symbol" })
kmap.set("n", "<leader>sS", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", { desc = "Goto Symbol (Workspace)" })

kmap.del({ "n", "v" }, "gra")
kmap.del("n", "gri")
kmap.del("n", "grr")
kmap.del("n", "grt")
kmap.del("n", "gO")

kmap.set({ "n", "v" }, "gra", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "LSP: Code Actions" })
kmap.set("n", "gri", "<cmd>FzfLua lsp_implementations<cr>", { desc = "LSP: Implementations" })
kmap.set("n", "grr", "<cmd>FzfLua lsp_references<cr>", { desc = "LSP: References" })
kmap.set("n", "grt", "<cmd>FzfLua lsp_typedefs<cr>", { desc = "LSP: Typedefs" })
kmap.set("n", "gO", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "LSP: Document Symbols" })
kmap.set("n", "grd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "Lsp: Definitions" })
kmap.set("n", "grD", "<cmd>FzfLua lsp_declarations<cr>", { desc = "Lsp: Declarations" })
