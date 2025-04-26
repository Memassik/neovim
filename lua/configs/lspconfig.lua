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
	local x = vim.diagnostic.severity

	vim.diagnostic.config({
		virtual_text = { prefix = "" },
		signs = { text = { [x.ERROR] = "E", [x.WARN] = "W", [x.INFO] = "I", [x.HINT] = "H" } },
		underline = true,
		float = { border = "single" },
	})

	local lua_lsp_settings = {
		Lua = {
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
					vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
					"${3rd}/luv/library",
				},
			},
		},
	}
	vim.lsp.config("*", { capabilities = M.capabilities, on_init = M.on_init, on_attach = M.on_attach })
	vim.lsp.config("lua_ls", { settings = lua_lsp_settings })
	vim.lsp.enable("lua_ls")
end

return M
