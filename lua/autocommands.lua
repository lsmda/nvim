vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Function to save the current file
local function save_file()
	if vim.bo.modifiable and vim.bo.modified and not vim.bo.readonly then
		vim.cmd("silent write")
	end
end

-- Set up an auto-command group to prevent duplicate autocmds
vim.api.nvim_create_augroup("autosave", {})

-- When text in any buffer is changed, start a timer to save the file after 1000ms (1 second)
vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
	group = "autosave",
	pattern = "*",
	callback = function()
		vim.defer_fn(save_file, 1000)
	end,
})
