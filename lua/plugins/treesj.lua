return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local treesj = require("treesj")

		treesj.setup({
			use_default_keymaps = false,
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>j", treesj.toggle)
		keymap.set("n", "<leader>J", function()
			treesj.toggle({ split = { recursive = true } })
		end)
	end,
}
