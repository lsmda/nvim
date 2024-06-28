-- normal mode
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })
vim.keymap.set("n", "<CR>", "o<Esc>", { desc = "Add line below cursor" })

vim.keymap.set("n", "<leader>sj", ":split<CR>", { desc = "Split screen below" })
vim.keymap.set("n", "<leader>sl", ":vsplit<CR>", { desc = "Split screen to the side" })

vim.keymap.set("n", "<M-h>", "<C-o>", { desc = "Navigate to previous cursor position" })
vim.keymap.set("n", "<M-l>", "<C-i>", { desc = "Navigate to next cursor position" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })

vim.keymap.set("n", "<S-M-k>", "<cmd>t .-1<cr>==", { desc = "Duplicate line up" })
vim.keymap.set("n", "<S-M-j>", "<cmd>t .<CR>==", { desc = "Duplicate line down" })

vim.keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle explorer" })

vim.keymap.set("n", "<leader>w", function()
	require("conform").format()
	vim.cmd("w")
end, { desc = "Format and write current buffer" })

vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit current buffer" })

vim.keymap.set("n", "<leader>Q", function()
	local confirm_quit = require("lsmda.core.utils").confirm_quit
	confirm_quit("qa!", "Are you sure you want to quit? Unsaved changes will be lost (y/N): ")
end, { desc = "Quit all open buffers" })

vim.keymap.set("n", "<leader>cs", function()
	vim.fn.setreg("/", "")
end, { desc = "Clear search pattern" })

-- insert mode
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Navigate left in insert mode" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Navigate right in insert mode" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Navigate down in insert mode" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Navigate up in insert mode" })

-- visual mode
vim.keymap.set("v", "'", "c''<Esc>P", { desc = "Surround selection with single quotes" })
vim.keymap.set("v", '"', 'c""<Esc>P', { desc = "Surround selection with double quotes" })
vim.keymap.set("v", "(", "c()<Esc>P", { desc = "Surround selection with parenthesis" })
vim.keymap.set("v", "[", "c[]<Esc>P", { desc = "Surround selection with brackets" })
vim.keymap.set("v", "{", "c{}<Esc>P", { desc = "Surround selection with curly braces" })

vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

vim.keymap.set("v", "<S-M-k>", "<cmd>VisualDuplicate -1<CR>", { desc = "Duplicate selection up" })
vim.keymap.set("v", "<S-M-j>", "<cmd>VisualDuplicate +1<CR>", { desc = "Duplicate selection down" })

-- mixed modes
vim.keymap.set({ "i", "v" }, "<M-n>", "<Esc>", { desc = "Enter normal mode" })
vim.keymap.set({ "n", "v" }, "<M-e>", "$", { desc = "Move cursor to end of line" })
vim.keymap.set({ "n", "v" }, "<M-q>", "^", { desc = "Move cursor to beginning of line" })
vim.keymap.set({ "n", "v" }, "<leader>rr", "<cmd>source %<CR>", { desc = "Resource configuration" })
