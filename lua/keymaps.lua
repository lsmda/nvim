-- set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local utils = require("core.utils")
local opts = utils.opts

-- enter normal mode
vim.keymap.set({ "i", "v" }, "<m-n>", "<esc>", opts)

-- select all
vim.keymap.set("n", "<c-a>", "ggVG", opts)

-- write all buffers then format open buffer
vim.keymap.set("n", "<c-s>", function()
	vim.cmd("wa")
	require("conform").format({})
end, opts)

vim.keymap.set("n", "<leader>q", ":q<CR>", opts)
vim.keymap.set("n", "<leader>x", ":x<CR>", opts)

-- custom motions
vim.keymap.set({ "n", "x" }, "<m-e>", "$") -- move cursor to end of line
vim.keymap.set({ "n", "x" }, "<m-q>", "0") -- move cursor to start of line

-- move line up/down
vim.keymap.set("n", "<m-k>", ":m .-2<cr>==", opts) -- move current line up
vim.keymap.set("n", "<m-j>", ":m .+1<cr>==", opts) -- move current line down
vim.keymap.set("v", "<m-k>", ":m '<-2<cr>gv=gv", opts) -- move current selection up
vim.keymap.set("v", "<m-j>", ":m '>+1<cr>gv=gv", opts) -- move current selection down

-- pane navigation
vim.keymap.set({ "n", "v" }, "<c-h>", ":tmuxnavigateleft<cr>", opts)
vim.keymap.set({ "n", "v" }, "<c-l>", ":tmuxnavigateright<cr>", opts)
vim.keymap.set({ "n", "v" }, "<c-j>", ":tmuxnavigatedown<cr>", opts)
vim.keymap.set({ "n", "v" }, "<c-k>", ":tmuxnavigateup<cr>", opts)

-- clear search pattern
vim.keymap.set("n", "<leader>cs", function()
	vim.fn.setreg("/", "")
end, opts)
