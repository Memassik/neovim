local M = {}

M.all_formats = {}

M.get_formats = function()
	M.all_formats = vim.tbl_deep_extend('force', {}, M.all_formats, require("configs.langs.c").format)
	return M.all_formats
end

return M
