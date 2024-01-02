return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local icons = require("user.icons")

		local diff = {
			"diff",
			colored = true,
			symbols = {
				added = icons.git.LineAdded,
				modified = icons.git.LineModified,
				removed = icons.git.LineRemoved,
			}, -- Changes the symbols used by the diff.
		}

		require("lualine").setup({
			options = {
				theme = "catppuccin",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				ignore_focus = { "NvimTree" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { diff },
				lualine_x = { "diagnostics" },
				lualine_y = { "filetype" },
				lualine_z = { "progress" },
			},
			extensions = { "quickfix", "man", "fugitive" },
		})
	end,
}
