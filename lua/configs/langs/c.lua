local M = {}

M.lang = function()
	return {
		autostart = false,
		capabilities = {
			offsetEncoding = { "utf-8", "utf-16" },
			textDocument = {
				completion = {
					editsNearCursor = true,
				},
			},
		},
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--header-insertion=never",
			"--completion-style=detailed",
			"--function-arg-placeholders",
			"--fallback-style=llvm",
		},
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		root_dir = function(fname)
			return require("lspconfig.util").root_pattern(
					"configure.ac",
					"configure.in",
					"config.h.in",
					"meson.build",
					"meson_options.txt",
					"build.ninja"
				)(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname) or
				require(
					"lspconfig.util"
				).find_git_ancestor(fname) or vim.fn.getcwd()
		end,
	}
end

M.format = {
	c = { "clang-format" },
	cpp = { "clang-format" },
}

M.setup = function()
	require("configs.lspconfig").defaults()

	local dap = require("dap")
	local lspconfig = require "lspconfig"
	local lsp = require "configs.lspconfig"
	local options = M.lang()

	options.capabilities = vim.tbl_deep_extend('force', {}, lsp.capabilities, options.capabilities or {})
	options.on_attach = lsp.on_attach
	options.on_init = lsp.on_init

	lspconfig.clangd.setup(options)

	dap.adapters.gdb = {
		type = "executable",
		command = "gdb",
		args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
	}

	dap.configurations.c = {
		{
			name = 'Run executable (GDB)',
			type = 'gdb',
			request = 'launch',
			-- This requires special handling of 'run_last', see
			-- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
			program = function()
				local path = vim.fn.input({
					prompt = 'Path to executable: ',
					default = vim.fn.getcwd() .. '/',
					completion = 'file',
				})

				return (path and path ~= '') and path or dap.ABORT
			end,
		},
		{
			name = 'Run executable with arguments (GDB)',
			type = 'gdb',
			request = 'launch',
			-- This requires special handling of 'run_last', see
			-- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
			program = function()
				local path = vim.fn.input({
					prompt = 'Path to executable: ',
					default = vim.fn.getcwd() .. '/',
					completion = 'file',
				})

				return (path and path ~= '') and path or dap.ABORT
			end,
			args = function()
				local args_str = vim.fn.input({
					prompt = 'Arguments: ',
				})
				return vim.split(args_str, ' +')
			end,
		},
		{
			name = 'Attach to process (GDB)',
			type = 'gdb',
			request = 'attach',
			processId = require('dap.utils').pick_process,
		},
	}
end

return M
