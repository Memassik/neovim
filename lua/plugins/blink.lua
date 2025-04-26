return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "1.*",
	build = "cargo build --release",
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
		"mikavilpas/blink-ripgrep.nvim",
	},
	opts = {
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
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "ripgrep" },
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
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep",
					opts = {
						prefix_min_len = 4,
						context_size = 5,
						max_filesize = "1M",
						project_root_marker = ".git",
						project_root_fallback = true,
						search_casing = "--ignore-case",
						additional_rg_options = {},
						fallback_to_regex_highlighting = true,
						ignore_paths = { "tags", "cscope*" },
						additional_paths = {},
						toggles = {
							-- The keymap to toggle the plugin on and off from blink
							-- completion results. Example: "<leader>tg"
							on_off = nil,
						},
						future_features = {
							issue185_workaround = true,
							backend = {
								use = "ripgrep",
							},
						},
						debug = false,
					},
					transform_items = function(_, items)
						for _, item in ipairs(items) do
							-- example: append a description to easily distinguish rg results
							item.labelDetails = {
								description = "(rg)",
							}
						end
						return items
					end,
				},
			},
		},
		snippets = { preset = "luasnip" },
		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				"exact",
				"score",
				"sort_text",
			},
		},
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
