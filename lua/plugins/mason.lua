return {
	"williamboman/mason.nvim",
	cmd = {
		"Mason",
		"MasonInstall",
		"MasonInstallAll",
		"MasonUninstall",
		"MasonUninstallAll",
		"MasonLog",
	},
	config = function()
		require("mason").setup({
			PATH = "prepend",
			ui = {
				icons = {
					package_pending = " ",
					package_installed = "󰄳 ",
					package_uninstalled = "󰚌 ",
				},
			},

			max_concurrent_installers = 10,
		})
	end,
}
