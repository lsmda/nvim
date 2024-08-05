local api = vim.api
local utils = require("lsmda.core.utils")

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

local general_autosave = vim.api.nvim_create_augroup("autosave", {})
api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
	pattern = "*",
	callback = function()
		if vim.fn.pumvisible() == 0 then
			vim.defer_fn(utils.save_file, 250)
		end
	end,
	group = general_autosave,
})

-- Run gofmt + goimports on save

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").gofmt()
	end,
	group = format_sync_grp,
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
