------------------------------- globals -------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.have_nerd_font = true

------------------------------- options -------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 0
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 999
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.mouse = ""
vim.opt.termguicolors = true
vim.opt.fillchars = { eob = " " }
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.inccommand = "split"
vim.opt.cursorline = false
vim.opt.splitkeep = "cursor"
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*", "*/.coverage/*" })
