local M = {}

M.all_formats = {}
M.adapters = {}
M.configurations = {}
M.langs = {}

M.get_langs_lists = function()
	local lang_files = vim.api.nvim_get_runtime_file("lua/configs/langs/*.lua", true)
	local ret = {}
	for _, v in ipairs(lang_files) do
		local item = v:gsub("^.*/lua/(.+)%.lua$", "%1"):gsub("/", ".")
		table.insert(ret, item)
	end
	return ret
end

M.get_formats = function()
	for _, v in ipairs(M.get_langs_lists()) do
		M.all_formats = vim.tbl_deep_extend("force", {}, M.all_formats, require(v).format())
	end
	return M.all_formats
end

M.get_adapters = function()
	for _, v in ipairs(M.get_langs_lists()) do
		M.adapters = vim.tbl_deep_extend("force", {}, M.adapters, require(v).dap().adapters)
	end
	return M.adapters
end

M.language_setup = function()
	for _, v in ipairs(M.get_langs_lists()) do
		require(v).lsp()
	end
end

return M
