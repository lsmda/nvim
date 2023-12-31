return {
	"rmagatti/alternate-toggler",
	event = { "BufReadPost" },
	config = function()
		require("alternate-toggler").setup({
			alternates = {
				["1"] = "0",
				["+"] = "-",
				["=="] = "!=",
				["==="] = "!==",
				[">"] = "<",
				[">="] = "<=",
				[">=="] = "<==",
				["true"] = "false",
				["True"] = "False",
				["TRUE"] = "FALSE",
				["yes"] = "no",
				["Yes"] = "No",
				["YES"] = "NO",
			},
		})

		vim.keymap.set("n", "<leader>tt", "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>")
	end,
}
