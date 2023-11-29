-- set <space> as the leader key
-- see `:help mapleader`
--  NOTE: must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- custom shortcuts
vim.keymap.set("i", "<A-n>", "<Esc>")
-- vim.keymap.set("n", "<A-e>", "")

-- clear input for regular expression search in current buffer
vim.api.nvim_set_keymap('n', 'cx', ':let @/=""<CR>', { noremap = true, silent = true })
