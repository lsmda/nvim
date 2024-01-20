return {
	{
		"hinell/duplicate.nvim",
		dependencies = {
			{
				"mrjones2014/legendary.nvim",
				version = "v2.13.6",
				priority = 10000,
				lazy = false,
			},
		},
		tag = "v1.1.0",
		config = function()
			local legendary = require("legendary")
			legendary.keymaps({
				{ description = "line: duplicate up", mode = { "n" }, "<S-M-k>", "<cmd>t .-1<cr>==" },
				{ description = "Line: duplicate down", mode = { "n" }, "<S-M-j>", "<cmd>t .<CR>==" },
				{ description = "Selection: duplicate up", mode = { "v" }, "<S-M-j>", "<cmd>VisualDuplicate +1<CR>" },
				{ description = "Selection: duplicate down", mode = { "v" }, "<S-M-k>", "<cmd>VisualDuplicate -1<cr>" },
			})
		end,
	},
}
