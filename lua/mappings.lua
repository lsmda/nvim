vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "ss", ":split<CR>", { desc = "[s]plit [s]creen horizontally" })
vim.keymap.set("n", "sv", ":vsplit<CR>", { desc = "[s]plit screen [v]ertically" })

vim.keymap.set("n", "<CR>", "o<Esc>", { desc = "Add line below cursor" })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

vim.keymap.set("n", "<M-h>", "<C-o>", { desc = "Navigate to previous cursor position" })
vim.keymap.set("n", "<M-l>", "<C-i>", { desc = "Navigate to next cursor position" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<S-M-k>", "<cmd>t .-1<cr>==", { desc = "Duplicate line up" })
vim.keymap.set("n", "<S-M-j>", "<cmd>t .<CR>==", { desc = "Duplicate line down" })

vim.keymap.set("n", "<C-e>", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>", { desc = "Toggle file explorer" })

local confirm_quit = require("utils").confirm_quit

-- save file and quit
vim.keymap.set("n", "<leader>w", function()
	require("conform").format()
	vim.cmd("w")
end, { desc = "[w]rite current buffer" })

vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "[q]uit current buffer" })

vim.keymap.set("n", "<leader>Q", function()
	confirm_quit("qa!", "Are you sure you want to quit? Unsaved changes will be lost (y/N): ")
end, { desc = "[Q]uit all open buffers" })

-- move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- resize window
vim.keymap.set("n", "<C-S-h>", "<C-w><")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")
vim.keymap.set("n", "<C-S-k>", "<C-w>+")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")

-- clear search pattern
vim.keymap.set("n", "<leader>cs", function()
	vim.fn.setreg("/", "")
end, { desc = "[c]lear [s]earch pattern" })

-- insert mode navigation
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Navigate left in insert mode" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Navigate right in insert mode" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Navigate down in insert mode" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Navigate up in insert mode" })

vim.keymap.set("i", "'", "''<left>")
vim.keymap.set("i", '"', '""<left>')
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")

vim.keymap.set({ "i", "v" }, "<M-n>", "<Esc>", { desc = "Enter normal mode" })

vim.keymap.set("v", "'", "c''<Esc>P")
vim.keymap.set("v", '"', 'c""<Esc>P')
vim.keymap.set("v", "(", "c()<Esc>P")
vim.keymap.set("v", "[", "c[]<Esc>P")
vim.keymap.set("v", "{", "c{}<Esc>P")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move visual selection up" })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move visual selection down" })
vim.keymap.set("v", "<S-M-k>", "<cmd>VisualDuplicate -1<CR>", { desc = "selection: duplicate up" })
vim.keymap.set("v", "<S-M-j>", "<cmd>VisualDuplicate +1<CR>", { desc = "selection: duplicate down" })

vim.keymap.set({ "n", "v" }, "<M-e>", "$", { desc = "End of line" })
vim.keymap.set({ "n", "v" }, "<M-q>", "^", { desc = "Beginning of line" })
vim.keymap.set({ "n", "v" }, "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Tmux navigate left command" })
vim.keymap.set({ "n", "v" }, "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Tmux navigate right command" })
vim.keymap.set({ "n", "v" }, "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Tmux navigate down command" })
vim.keymap.set({ "n", "v" }, "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Tmux navigate up command" })
