-- set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- Enter normal mode
vim.keymap.set("i", "<m-n>", "<esc>", opts)

-- Clone current line above/below
vim.keymap.set({ "n", "v" }, "<M-k>", "yypk==", opts)
vim.keymap.set({ "n", "v" }, "<M-j>", "yyPj==", opts)

-- Pane navigation
vim.keymap.set({ "n", "v" }, "<C-h>", ":TmuxNavigateLeft<CR>", opts)
vim.keymap.set({ "n", "v" }, "<C-l>", ":TmuxNavigateRight<CR>", opts)
vim.keymap.set({ "n", "v" }, "<C-j>", ":TmuxNavigateDown<CR>", opts)
vim.keymap.set({ "n", "v" }, "<C-k>", ":TmuxNavigateUp<CR>", opts)
