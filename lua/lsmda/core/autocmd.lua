---@diagnostic disable: undefined-field

local utils = require("lsmda.core.utils")

-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- auto-save file on change
local general_autosave = vim.api.nvim_create_augroup("autosave", {})
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
	pattern = "*",
	callback = function()
		if vim.fn.pumvisible() == 0 then
			vim.defer_fn(utils.save_file, 10)
		end
	end,
	group = general_autosave,
})
