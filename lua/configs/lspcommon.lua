local M = {}

M.servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
}

M.servers = vim.tbl_deep_extend("force", {}, M.servers, require("configs.lsplangs").get_langs())

M.global_capabilities = {}

M.capabilities = vim.tbl_deep_extend(
	"force",
	{},
	vim.lsp.protocol.make_client_capabilities(),
	require("blink.cmp").get_lsp_capabilities() or {},
	M.global_capabilities.capabilities or {}
)

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

M.opts = {
	servers = M.servers,
	setup = {
		-- example to setup with typescript.nvim
		-- tsserver = function(_, opts)
		--   require("typescript").setup({ server = opts })
		--   return true
		-- end,
		-- Specify * to use this function as a fallback for any server
		-- ["*"] = function(server, opts) end,
	},
}

M.ensure_installed = {}

M.setup = function(server)
	local server_opts = vim.tbl_deep_extend("force", {
		capabilities = vim.deepcopy(M.capabilities),
	}, M.opts.servers[server] or {})

	if M.opts.setup[server] then
		if M.opts.setup[server](server, server_opts) then
			return
		end
	elseif M.opts.setup["*"] then
		if M.opts.setup["*"](server, server_opts) then
			return
		end
	end
	require("lspconfig")[server].setup(server_opts)
end

M.mason_setup = function()
	local mlsp = require("mason-lspconfig")
	local available = mlsp.get_available_servers()

	for _server, _server_opts in pairs(M.servers) do
		if _server_opts then
			_server_opts = _server_opts == true and {} or _server_opts
			-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
			if _server_opts.mason == false or not vim.tbl_contains(available, _server) then
				M.setup(_server)
			else
				M.ensure_installed[#M.ensure_installed + 1] = _server
			end
		end
	end
end

M.config = function()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
		callback = function(event)
			local map = function(keys, func, desc, mode)
				mode = mode or "n"
				vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
			end

			map("gd", "<cmd>FzfLua lsp_definitions<cr>", "Go to definition")
			map("gD", vim.lsp.buf.declaration, "Go to declaration")
			map("gr", "<cmd>FzfLua lsp_references<cr>", "Show references")
			map("gI", "<cmd>FzfLua lsp_implementations<cr>", "Go to implementation")
			map("<leader>ch", vim.lsp.buf.signature_help, "Show signature help")
			map("<leader>D", "<cmd>FzfLua lsp_typedefs<cr>", "Go to type definition")
			map("<leader>ds", "<cmd>FzfLua lsp_document_symbols<cr>", "Document Symbols")
			map("<leader>ws", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", "Workspace Symbols")
			map("<leader>ca", vim.lsp.buf.code_action, "Code action")

			local client = vim.lsp.get_client_by_id(event.data.client_id)
			if
				client
				and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
			then
				local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.clear_references,
				})

				vim.api.nvim_create_autocmd("LspDetach", {
					group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
					callback = function(event2)
						vim.lsp.buf.clear_references()
						vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
					end,
				})
			end

			if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
				map("<leader>uL", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
				end, "Toggle Inlay Hints")
			end
		end,
	})

	vim.diagnostic.config({
		virtual_text = { prefix = "" },
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "E",
				[vim.diagnostic.severity.WARN] = "W",
				[vim.diagnostic.severity.INFO] = "I",
				[vim.diagnostic.severity.HINT] = "H",
			},
		},
		underline = true,
		float = { border = "single" },
	})

	M.mason_setup()

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = M.ensure_installed,
		automatic_installation = true,
	})
	require("mason-lspconfig").setup_handlers({ M.setup })
end

return M
