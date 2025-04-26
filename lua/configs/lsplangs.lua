local M = {}

M.langs = {}

M.get_langs = function()
	M.langs = vim.tbl_deep_extend("force", {}, M.langs, require("configs.langs.c").lang)
	return M.langs
end

return M
