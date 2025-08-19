return {
	"sheerun/vim-polyglot",
	lazy = true,
	cmd = { "PolyglotToggle", "PolyglotEnable", "PolyglotDisable" },
	config = function()
		-- Function to toggle Vim Polyglot
		function PolyglotToggle()
			if vim.g.polyglot_disabled and #vim.g.polyglot_disabled > 0 then
				vim.g.polyglot_disabled = {}
				print("Polyglot enabled")
			else
				vim.g.polyglot_disabled = { "all" }
				print("Polyglot disabled")
			end
		end

		function PolyglotEnable()
			vim.g.polyglot_disabled = {}
		end

		function PolyglotDisable()
			vim.g.polyglot_disabled = { "all" }
		end

		-- Create a command to call the toggle function
		vim.api.nvim_create_user_command("PolyglotToggle", PolyglotToggle, {})
		vim.api.nvim_create_user_command("PolyglotEnable", PolyglotEnable, {})
		vim.api.nvim_create_user_command("PolyglotDisable", PolyglotDisable, {})

		vim.cmd("PolyglotDisable")
	end,
}
