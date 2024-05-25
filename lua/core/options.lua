local opt = vim.opt
local o = vim.o
local g = vim.g

------------------------------- globals -------------------------------
g.mapleader = " "
g.maplocalleader = " "

-- Disable netrw for nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

------------------------------- options -------------------------------
o.number = true
o.relativenumber = true
o.numberwidth = 4

o.splitbelow = true
o.splitright = true

o.hlsearch = false
o.incsearch = true
o.cursorline = false

o.wrap = false
o.fileencoding = "utf-8"

o.clipboard = "unnamedplus"
o.scrolloff = 999

o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.autoindent = true

o.ignorecase = true
o.smartcase = true

o.hidden = true
o.showmode = false
o.signcolumn = "yes"

o.backup = false
o.swapfile = false

o.mouse = ""
o.termguicolors = true

opt.fillchars = { eob = " " }
