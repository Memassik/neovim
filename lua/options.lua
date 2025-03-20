local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------
g.mapleader = " "
g.maplocalleader = "\\"

o.laststatus = 3
o.showmode = false
o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"
-- Indenting
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4
o.ignorecase = true
o.smartcase = true
o.mouse = "a"
-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")
g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Set LSP servers to be ignored when used with `util.root.detectors.lsp`
-- for detecting the LSP root
g.root_lsp_ignore = { "copilot" }

-- Hide deprecation warnings
g.deprecation_warnings = false

opt.autowrite = true -- Enable auto write
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.foldlevel = 99
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.sidescrolloff = 8 -- Columns of context
opt.spelllang = { "en" }
opt.splitkeep = "screen"
opt.termguicolors = true -- True color support
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
