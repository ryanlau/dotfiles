vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

local opt = vim.opt

opt.termguicolors = true

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

opt.mouse = "a"

vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

opt.list = true
-- opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.inccommand = "split"

opt.cursorline = true

opt.scrolloff = 5

opt.tabstop = 2
opt.shiftwidth = 0
