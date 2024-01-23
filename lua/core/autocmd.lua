local api = vim.api
local utils = require("core.utils")

-- Don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight yanked text
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Show cursor line in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, { pattern = "*", command = "set cursorline", group = cursorGrp })
api.nvim_create_autocmd(
	{ "InsertEnter", "WinLeave" },
	{ pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- Auto-save file on change
local save_file = utils.save_file

api.nvim_create_augroup("autosave", {})
api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "InsertLeave" }, {
	group = "autosave",
	pattern = "*",
	callback = function()
		if vim.fn.pumvisible() == 0 then
			vim.defer_fn(save_file, 350) -- Delay in milliseconds
		end
	end,
})
