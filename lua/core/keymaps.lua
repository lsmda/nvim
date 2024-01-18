-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local utils = require("core.utils")
local opts = utils.opts

local function map(mode, shortcut, command, options)
	if options then
		opts = vim.tbl_extend("force", opts, options)
	end
	vim.keymap.set(mode, shortcut, command, opts)
end

map({ "i", "v" }, "<M-n>", "<ESC>") -- Enter normal mode

map("n", "<C-a>", "ggVG") -- Select all in normal mode
map("v", "<C-a>", "<ESC>ggVG") -- Select all in visual mode

map("n", "<CR>", "o<ESC>") -- Add new line on <Enter> press

map("n", "<M-h>", "<C-o>") -- Navigate to previous cursor position
map("n", "<M-l>", "<C-i>") -- Navigate to forward cursor position

map("n", "<C-d>", "<C-d>zz") -- Scroll down with cursor centered
map("n", "<C-u>", "<C-u>zz") -- Scroll up with cursor centered

-- Write all open buffers, then format current buffer
map("n", "<C-s>", function()
	vim.cmd("wa")
	require("conform").format()
end)

map({ "n", "x" }, "<M-e>", "$") -- Nove cursor to end of line
map({ "n", "x" }, "<M-q>", "^") -- Move cursor to start of line

map("n", "<M-k>", ":m .-2<CR>==") -- Move current line up
map("n", "<M-j>", ":m .+1<CR>==") -- Move current line down
map("v", "<M-k>", ":m '<-2<CR>gv=gv") -- Move current selection up
map("v", "<M-j>", ":m '>+1<CR>gv=gv") -- Move current selection down

-- Pane navigation
map({ "n", "v" }, "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
map({ "n", "v" }, "<C-l>", "<cmd>TmuxNavigateRight<CR>")
map({ "n", "v" }, "<C-j>", "<cmd>TmuxNavigateDown<CR>")
map({ "n", "v" }, "<C-k>", "<cmd>TmuxNavigateUp<CR>")

-- Clear search pattern
map("n", "<leader>cs", function()
	vim.fn.setreg("/", "")
end)

map("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>') -- Replace all instances of highlighted words

-- Automatically close character pair
map("i", "'", "''<left>")
map("i", '"', '""<left>')
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")

-- enclose visual selection with character pair
map("v", "'", "c''<Esc>P")
map("v", '"', 'c""<Esc>P')
map("v", "(", "c()<Esc>P")
map("v", "[", "c[]<Esc>P")
map("v", "{", "c{}<Esc>P")

local function confirm_quit(command)
	local choice = vim.fn.input("Are you sure you want to quit? (y/N): ")
	if choice:lower() == "y" then
		vim.cmd(command)
	end
end

-- Write all open buffers, then exit neovim
map("n", "<leader>s", function()
	confirm_quit("wqa")
end)

-- Ignore all open buffers, then exit neovim
map("n", "<leader>q", function()
	confirm_quit("qa!")
end)
