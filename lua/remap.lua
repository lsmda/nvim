-- set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ custom shortcuts ]]
vim.keymap.set("i", "<M-n>", "<Esc>", { desc = 'Enter normal mode', noremap = true, silent = true })

-- clear input for regular expression search in current buffer
vim.api.nvim_set_keymap('n', '<M-cs>', ':let @/=""<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<M-k>', 'yypk', { desc = 'Clone current line above', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-j>', 'yyPj', { desc = 'Clone current line below', noremap = true, silent = true })