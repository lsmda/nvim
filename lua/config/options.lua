------------------------------- globals -------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.have_nerd_font = true

------------------------------- options -------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

-- tabs and indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- keep indent from current line
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.path:append { "**" }
vim.opt.wildignore:append { "*/node_modules/*", "*/.coverage/*", "*/build/*", "*/dist/*" }

vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.backspace = { "start", "eol", "indent" }

vim.opt.clipboard:append "unnamedplus"

-- split windows
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.laststatus = 0
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.scrolloff = 999
vim.opt.hidden = true
vim.opt.showmode = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.mouse = ""
vim.opt.fillchars = { eob = " " }
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.inccommand = "split"
vim.opt.splitkeep = "cursor"
vim.opt.guicursor = "n-v-i-c:block-Cursor"
