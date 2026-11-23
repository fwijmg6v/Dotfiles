-- ~/.config/nvim/lua/config/options.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.opt

o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true
o.scrolloff = 8
o.termguicolors = true

o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true
o.smartindent = true

o.ignorecase = true
o.smartcase = true

o.splitright = true
o.splitbelow = true

o.undofile = true
o.swapfile = false
o.updatetime = 250

o.completeopt = { "menu", "menuone", "noselect" }

vim.cmd.colorscheme("icemono")
