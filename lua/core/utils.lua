local M = {}

M.opts = { noremap = true, silent = true }

M.map = function(mode, shortcut, command, options)
	local effective_opts = M.opts
	if options then
		effective_opts = vim.tbl_extend("force", effective_opts, options)
	end
	vim.keymap.set(mode, shortcut, command, effective_opts)
end

return M
