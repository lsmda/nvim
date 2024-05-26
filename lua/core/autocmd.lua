local api = vim.api
local utils = require("core.utils")

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- auto-save file on change
api.nvim_create_augroup("autosave", {})
api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "InsertLeave" }, {
	group = "autosave",
	pattern = "*",
	callback = function()
		if vim.fn.pumvisible() == 0 then
			vim.defer_fn(utils.save_file, 250)
		end
	end,
})

-- hide cursor when leaping, and restore it afterwards.
api.nvim_create_autocmd("User", {
	pattern = "LeapEnter",
	callback = function()
		vim.cmd.hi("Cursor", "blend=100")
		vim.opt.guicursor:append({ "a:Cursor/lCursor" })
	end,
})

api.nvim_create_autocmd("User", {
	pattern = "LeapLeave",
	callback = function()
		vim.cmd.hi("Cursor", "blend=0")
		vim.opt.guicursor:remove({ "a:Cursor/lCursor" })
	end,
})
