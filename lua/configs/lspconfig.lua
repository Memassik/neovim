local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(_, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", opts("Go to definition"))
	map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "gr", "<cmd>FzfLua lsp_references<cr>", opts("Show references"))
	map("n", "gI", "<cmd>FzfLua lsp_implementations<cr>", opts("Go to implementation"))
	map("n", "<leader>ch", vim.lsp.buf.signature_help, opts("Show signature help"))
	map("n", "<leader>D", "<cmd>FzfLua lsp_typedefs<cr>", opts("Go to type definition"))
	map("n", "<leader>cr", require("configs.lsp.renamer"), opts("Renamer"))
	map("n", "<leader>ds", "<cmd>FzfLua lsp_document_symbols<cr>", opts("Document Symbols"))
	map("n", "<leader>ws", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", opts("Workspace Symbols"))
	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
end

-- disable semanticTokens
M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

M.defaults = function()
	require("configs.lsp").diagnostic_config()

	require("lspconfig").lua_ls.setup({
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		on_init = M.on_init,

		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						vim.fn.expand("$VIMRUNTIME/lua"),
						vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
						vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
						"${3rd}/luv/library",
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
			},
		},
	})
end

return M
