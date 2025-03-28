local M = {}

M.lang = function()
    return {
		autostart = false,
		imports = {
			granularity = {
				group = "module",
			},
			prefix = "self",
		},
		cargo = {
			buildScripts = {
				enable = true,
			},
		},
		procMacro = {
			enable = true,
		},
	}
end

M.format = {
    rust = { "rustfmt" },
}

M.setup = function()
    require("configs.lspconfig").defaults()

    local lspconfig = require "lspconfig"
    local lsp = require "configs.lspconfig"
    local options = M.lang()

    options.capabilities = vim.tbl_deep_extend('force', {}, lsp.capabilities, options.capabilities or {})
    options.on_attach = lsp.on_attach
    options.on_init = lsp.on_init

    lspconfig.rust_analyzer.setup(options)
end

return M
