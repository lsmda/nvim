return {
	{
		"hinell/duplicate.nvim",
		dependencies = {
			{
				"mrjones2014/legendary.nvim",
				version = "v2.1.0",
				priority = 10000,
				lazy = false,
			},
		},
		tag = "v1.1.0",
		config = function()
			local legendary = require("legendary")
			legendary.keymaps({
				{ description = "Line: duplicate up", mode = { "n" }, "<S-M-k>", ":t .-1<CR>==" },
				{ description = "Line: duplicate down", mode = { "n" }, "<S-M-j>", ":t .<CR>==" },
				{ description = "Selection: duplicate up", mode = { "v" }, "<S-M-j>", ":VisualDuplicate +1<CR>" },
				{ description = "Selection: duplicate down", mode = { "v" }, "<S-M-k>", ":VisualDuplicate -1<cr>" },
			})
		end,
	},
}
