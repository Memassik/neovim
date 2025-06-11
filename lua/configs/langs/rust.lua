local M = {}

M.lang = function()
	local ret = {
		rust_analyzer = {
			autostart = false,
			mason = false,
		},
	}
	return ret
end

M.format = function()
	local ret = {
		rust = { "rustfmt" },
	}
	return ret
end

M.dap = function()
	local ret = {
		adapters = {
			gdb = {
				type = "executable",
				command = "gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			},
		},

		configurations = {
			rust = {
				{
					name = "Run executable (GDB)",
					type = "gdb",
					request = "launch",
					-- This requires special handling of 'run_last', see
					-- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
					program = function()
						local path = vim.fn.input({
							prompt = "Path to executable: ",
							default = vim.fn.getcwd() .. "/",
							completion = "file",
						})
						return (path and path ~= "") and path or require("dap").ABORT
					end,
				},
				{
					name = "Run executable with arguments (GDB)",
					type = "gdb",
					request = "launch",
					-- This requires special handling of 'run_last', see
					-- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
					program = function()
						local path = vim.fn.input({
							prompt = "Path to executable: ",
							default = vim.fn.getcwd() .. "/",
							completion = "file",
						})

						return (path and path ~= "") and path or require("dap").ABORT
					end,
					args = function()
						local args_str = vim.fn.input({
							prompt = "Arguments: ",
						})
						return vim.split(args_str, " +")
					end,
				},
				{
					name = "Attach to process (GDB)",
					type = "gdb",
					request = "attach",
					processId = require("dap.utils").pick_process,
				},
			},
		},
	}
	return ret
end

return M
