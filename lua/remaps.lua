-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- Enter normal mode
vim.keymap.set("i", "<M-n>", "<esc>", opts)

-- Custom motions
vim.keymap.set("n", "<M-e>", "$") -- Move cursor to end of line
vim.keymap.set("n", "<M-q>", "0") -- Move cursor to start of line

-- Move line up/down
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", opts) -- Move current line up
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", opts) -- Move current line down
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", opts) -- Move current selection up
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", opts) -- Move current selection down

-- Duplicate line up/down
vim.keymap.set("n", "<S-M-k>", ":t .-1<CR>==", opts) -- Duplicate current line up
vim.keymap.set("n", "<S-M-j>", ":t .<CR>==", opts) -- Duplicate current line down
vim.keymap.set("v", "<S-M-j>", ":VisualDuplicate +1<CR>", opts) -- Duplicate current selection down
vim.keymap.set("v", "<S-M-k>", ":VisualDuplicate -1<CR>", opts) -- Duplicate current selection up

-- Pane navigation
vim.keymap.set({ "n", "v" }, "<C-h>", ":TmuxNavigateLeft<CR>", opts)
vim.keymap.set({ "n", "v" }, "<C-l>", ":TmuxNavigateRight<CR>", opts)
vim.keymap.set({ "n", "v" }, "<C-j>", ":TmuxNavigateDown<CR>", opts)
vim.keymap.set({ "n", "v" }, "<C-k>", ":TmuxNavigateUp<CR>", opts)

-- Paste clipboard content without storing changed content
vim.keymap.set({ "v" }, "p", [["_dP]], opts)

-- Set search pattern and change the word's next instances (press . to repeat the action)
vim.keymap.set("v", "<leader>co", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>Ncgn", opts)

-- Clear search pattern
vim.keymap.set("n", "<leader>cs", function()
	vim.fn.setreg("/", "")
end, opts)
