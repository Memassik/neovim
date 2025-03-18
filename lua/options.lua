local opt = vim.opt
local o = vim.o
local g = vim.g
-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false

opt.guicursor = ""

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.termguicolors = true

g.have_nerd_font = true

vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)

o.cursorline = true
o.cursorlineopt = "number"

opt.inccommand = "split"

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.scrolloff = 10

-- Indenting
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4
o.ignorecase = true
o.smartcase = true
o.mouse = "a"
opt.breakindent = true
-- Numbers
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false
-- disable nvim intro
opt.shortmess:append "sI"
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

o.updatetime = 250

opt.whichwrap:append "<>[]hl"

g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

vim.bo.omnifunc = "ccomplete@Complete"

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH



