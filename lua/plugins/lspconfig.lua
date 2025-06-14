return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"j-hui/fidget.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		require("configs.lang-config").language_setup()
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
				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
					map("<leader>uL", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "Toggle Inlay Hints")
				end
			end,
		})

		-- Diagnostic Config
		-- See :help vim.diagnostic.Opts
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "E ",
					[vim.diagnostic.severity.WARN] = "W ",
					[vim.diagnostic.severity.INFO] = "I ",
					[vim.diagnostic.severity.HINT] = "H ",
				},
			} or {},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})
	end,
	opts = {},
}
