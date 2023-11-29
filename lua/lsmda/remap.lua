-- set <space> as the leader key
-- see `:help mapleader`
-- NOTE: must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ custom shortcuts ]]
vim.keymap.set("i", "<M-n>", "<Esc>", { desc = 'Normal mode', noremap = true, silent = true })
vim.keymap.set("n", "<M-s>", ":E<CR>", { desc = 'File explorer', noremap = true, silent = true })

-- clear input for regular expression search in current buffer
vim.api.nvim_set_keymap('n', '<M-cs>', ':let @/=""<CR>', { noremap = true, silent = true })

-- clone current line above
vim.api.nvim_set_keymap('n', '<M-j>', 'yyPj', { noremap = true, silent = true })

-- clone current line below
vim.api.nvim_set_keymap('n', '<M-k>', 'yypk', { noremap = true, silent = true })
