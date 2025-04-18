return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			-- component_separators = { left = '', right = '' },
			-- section_separators = { left = '', right = '' },
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			disabled_filetypes = {
				'packer',
				'NvimTree',
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},
		sections = {
			lualine_a = { "mode", "filesize" },
			lualine_b = { { "filename", path = 1 }, },
			lualine_c = { "location", "progress", },
			lualine_x = { "lsp_status", {
				"diagnostics",
				symbols = { error = '', warn = '', info = '', hint = '' },
				sections = {'error', 'warn', 'info'},
				colored = true,
				always_visible = true,
			}, },
			lualine_y = { "filetype", "encoding", },
			lualine_z = { "branch", { "diff", colored = false, }, },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
