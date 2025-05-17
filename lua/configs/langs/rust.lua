local M = {}

M.lang = function()
	local ret = {
		rust_analyzer = {
			autostart = false,
			mason = false,
		}
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
	-- Defined in c.lua
	local ret = {}
	return ret
end

return M
