-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local utils = require("core.utils")
local opts = utils.opts

-- Enter normal mode
vim.keymap.set({ "i", "v" }, "<m-n>", "<ESC>", opts)

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- Add new line on <Enter> key press
vim.keymap.set("n", "<CR>", "o<ESC>", opts)

vim.keymap.set("n", "<M-h>", "<C-o>", opts)
vim.keymap.set("n", "<M-l>", "<C-i>", opts)

-- Write all buffers then format current open buffer
vim.keymap.set("n", "<C-s>", function()
	vim.cmd("wa")
	require("conform").format()
end, opts)

-- Write all open buffers then exit neovim
vim.keymap.set("n", "<leader>q", ":wqa<CR>", opts)

vim.keymap.set({ "n", "x" }, "<M-e>", "$") -- Nove cursor to end of line
vim.keymap.set({ "n", "x" }, "<M-q>", "0") -- Move cursor to start of line

-- Move line up/down
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", opts) -- Move current line up
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", opts) -- Move current line down
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", opts) -- Move current selection up
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", opts) -- Move current selection down

-- Pane navigation
vim.keymap.set({ "n", "v" }, "<C-h>", ":TmuxNavigateLeft<CR>", opts)
vim.keymap.set({ "n", "v" }, "<C-l>", ":TmuxNavigateRight<CR>", opts)
vim.keymap.set({ "n", "v" }, "<C-j>", ":TmuxNavigateDown<CR>", opts)
vim.keymap.set({ "n", "v" }, "<C-k>", ":TmuxNavigateUp<CR>", opts)

-- Clear search pattern
vim.keymap.set("n", "<leader>cs", function()
	vim.fn.setreg("/", "")
end, opts)
