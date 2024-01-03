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
				{ description = "Line: duplicate up", mode = { "n" }, "<s-m-k>", ":t .-1<cr>==" },
				{ description = "Line: duplicate down", mode = { "n" }, "<s-m-j>", ":t .<cr>==" },
				{ description = "Selection: duplicate up", mode = { "v" }, "<s-m-j>", ":VisualDuplicate +1<cr>" },
				{ description = "Selection: duplicate down", mode = { "v" }, "<s-m-k>", ":VisualDuplicate -1<cr>" },
			})
		end,
	},
}
