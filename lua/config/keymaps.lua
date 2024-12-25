local map = require("config.utils").map

-- normal mode
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map("n", "<CR>", "o<Esc>", { desc = "Add line below cursor" })

map("n", "p", '"0p', { desc = "Paste last yanked text" })
map("n", "P", '"0P', { desc = "Paste last yanked text above" })

map("n", "<leader>sj", ":split<CR>", { desc = "Split screen below" })
map("n", "<leader>sl", ":vsplit<CR>", { desc = "Split screen to the side" })

map("n", "<M-h>", "<C-o>", { desc = "Navigate to previous cursor position" })
map("n", "<M-l>", "<C-i>", { desc = "Navigate to next cursor position" })

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

map("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })

map("n", "<S-M-k>", "<CMD>t .-1<cr>==", { desc = "Duplicate line up" })
map("n", "<S-M-j>", "<CMD>t .<CR>==", { desc = "Duplicate line down" })

map("n", "<leader>q", ":q<CR>", { desc = "Quit current buffer" })

map("n", "<leader>Q", function()
  local confirm_quit = require("config.utils").confirm_quit
  confirm_quit("qa!", "Are you sure you want to quit? Unsaved changes will be lost (y/N): ")
end, { desc = "Quit all open buffers" })

map("n", "<leader>cs", function()
  vim.fn.setreg("/", "")
end, { desc = "Clear search pattern" })

-- window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Navigate to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate to top window" })

map("n", "<leader>'", [[:s/\<<C-r><C-w>\>/'<C-r><C-w>\'/ <CR>]], { desc = "Surround word with '" })
map("n", '<leader>"', [[:s/\<<C-r><C-w>\>/"<C-r><C-w>\"/ <CR>]], { desc = 'Surround word with "' })
map("n", "<leader>*", [[:s/\<<C-r><C-w>\>/*<C-r><C-w>\*/ <CR>]], { desc = "Surround word with *" })
map("n", "<leader>(", [[:s/\<<C-r><C-w>\>/(<C-r><C-w>\)/ <CR>]], { desc = "Surround word with (" })
map("n", "<leader>[", [[:s/\<<C-r><C-w>\>/[<C-r><C-w>\]/ <CR>]], { desc = "Surround word with [" })
map("n", "<leader>{", [[:s/\<<C-r><C-w>\>/{<C-r><C-w>\}/ <CR>]], { desc = "Surround word with {" })

map({ "n" }, "<leader>rr", "<CMD>source %<CR>", { desc = "Source configuration" })

-- insert mode
map("i", "<C-h>", "<Left>", { desc = "Move cursor to the left" })
map("i", "<C-l>", "<Right>", { desc = "Move cursor to the right" })
map("i", "<C-j>", "<Down>", { desc = "Move cursor down" })
map("i", "<C-k>", "<Up>", { desc = "Move cursor up" })

-- visual mode
map("x", "'", "c''<Esc>P", { desc = "Surround selection with '" })
map("x", '"', 'c""<Esc>P', { desc = 'Surround selection with "' })
map("x", "*", "c**<Esc>P", { desc = "Surround selection with *" })
map("x", "(", "c()<Esc>P", { desc = "Surround selection with (" })
map("x", "[", "c[]<Esc>P", { desc = "Surround selection with [" })
map("x", "{", "c{}<Esc>P", { desc = "Surround selection with {" })

map("x", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("x", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- mixed modes
map({ "i", "x", "t" }, "<M-n>", "<Esc>", { desc = "Enter normal mode" })
map({ "n", "x" }, "<M-e>", "$", { desc = "Move cursor to end of line" })
map({ "n", "x" }, "<M-q>", "^", { desc = "Move cursor to beginning of line" })
