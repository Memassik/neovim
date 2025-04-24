local M = {}

M.adapters = {}
M.configurations = {}
M.dap_cfg = {}

M.get_adapters = function()
	M.adapters = vim.tbl_deep_extend('force', {}, M.adapters, require("configs.langs.c").dap().adapters)
	return M.adapters
end

M.get_configurations = function()
	M.configurations = vim.tbl_deep_extend('force', {}, M.configurations, require("configs.langs.c").dap()
	.configurations)
	return M.configurations
end

return M
