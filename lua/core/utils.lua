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

M.load_mappings = function(section, mapping_opt)
	vim.schedule(function()
		local function set_section_map(section_values)
			if section_values.plugin then
				return
			end

			section_values.plugin = nil

			for mode, mode_values in pairs(section_values) do
				local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
				for keybind, mapping_info in pairs(mode_values) do
					-- merge default + user opts
					local opts = merge_tb("force", default_opts, mapping_info.opts or {})

					mapping_info.opts, opts.mode = nil, nil
					opts.desc = mapping_info[2]

					vim.keymap.set(mode, keybind, mapping_info[1], opts)
				end
			end
		end

		local mappings = require("core.mappings")

		if type(section) == "string" then
			mappings[section]["plugin"] = nil
			mappings = { mappings[section] }
		end

		for _, sect in pairs(mappings) do
			set_section_map(sect)
		end
	end)
end

M.opts = { noremap = true, silent = true }

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

return M
