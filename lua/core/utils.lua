local M = {}
local merge_tb = vim.tbl_deep_extend

M.confirm_quit = function(command, input, default_choice)
	default_choice = default_choice or false
	input = input or "Are you sure you want to quit? (y/N): "

	local choice = ""

	if not default_choice then
		choice = vim.fn.input(input)
	end

	if default_choice or choice:lower() == "y" then
		vim.cmd(command)
	end
end

M.icons = require("core.icons")

M.save_file = function()
	-- Check for the specific conditions where we don't want to save
	local is_floating_window_open = false
	for _, win in pairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then
			is_floating_window_open = true
			break
		end
	end

	-- Save only if the buffer is modifiable, has been modified, not readonly, not a new buffer (buftype is empty),
	-- and no floating windows (like Telescope) are open
	if
		vim.bo.modifiable
		and vim.bo.modified
		and not vim.bo.readonly
		and vim.bo.buftype == ""
		and not is_floating_window_open
	then
		vim.cmd("silent write")
	end
end

M.get_float_opts = function(options)
	options = options or {}
	return {
		border = options.border or "rounded",
		prefix = options.prefix or " ",
		severity_sort = options.severity_sort or true,
		scope = options.scope or "buffer",
		source = options.source or false,
	}
end

return M
