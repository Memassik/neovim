return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "1.*",
	-- build = "cargo build --release",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = "make install_jsregexp",
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			opts = {},
		},
	},
	opts = {
		cmdline = {
			enabled = false,
		},
		keymap = {
			-- All presets have the following mappings:
			-- <tab>/<s-tab>: move to right/left of your snippet expansion
			-- <c-space>: Open menu or open docs if already open
			-- <c-n>/<c-p> or <up>/<down>: Select next/previous item
			-- <c-e>: Hide menu
			-- <c-k>: Toggle signature help
			preset = "default",
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			accept = {
				auto_brackets = { enabled = false },
			},
			documentation = {
				auto_show = false,
				auto_show_delay_ms = 250,
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				buffer = {
					opts = {
						get_bufnrs = function()
							return vim.tbl_filter(function(bufnr)
								return vim.bo[bufnr].buftype == ""
							end, vim.api.nvim_list_bufs())
						end,
					},
				},
				path = {
					opts = {
						get_cwd = function(_)
							return vim.fn.getcwd()
						end,
					},
				},
			},
		},
		snippets = { preset = "luasnip" },
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
