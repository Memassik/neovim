return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		{ "williamboman/mason-lspconfig.nvim", config = function() end },
	},
	config = function()
		local lservers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
		}

		local opts = {
			servers = lservers,
			setup = {
				-- example to setup with typescript.nvim
				-- tsserver = function(_, opts)
				--   require("typescript").setup({ server = opts })
				--   return true
				-- end,
				-- Specify * to use this function as a fallback for any server
				-- ["*"] = function(server, opts) end,
			},
		}

		local servers = opts.servers
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			require("blink.cmp").get_lsp_capabilities() or {},
			opts.capabilities or {}
		)

		local function setup(server)
			local server_opts = vim.tbl_deep_extend("force", {
				capabilities = vim.deepcopy(capabilities),
			}, servers[server] or {})

			if opts.setup[server] then
				if opts.setup[server](server, server_opts) then
					return
				end
			elseif opts.setup["*"] then
				if opts.setup["*"](server, server_opts) then
					return
				end
			end
			require("lspconfig")[server].setup(server_opts)
		end

		local mlsp = require("mason-lspconfig")
		local available = mlsp.get_available_servers()

		local ensure_installed = {} ---@type string[]
		for server, server_opts in pairs(servers) do
			if server_opts then
				server_opts = server_opts == true and {} or server_opts
				-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
				if server_opts.mason == false or not vim.tbl_contains(available, server) then
					setup(server)
				else
					ensure_installed[#ensure_installed + 1] = server
				end
			end
		end

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
			automatic_installation = true,
		})
		require("mason-lspconfig").setup_handlers({ setup })
	end,
}
