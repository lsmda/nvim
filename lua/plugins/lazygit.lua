return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local utils = require("core.utils")
		local map = utils.map

		map("n", "<leader>gg", "<cmd>LazyGit<CR>")
	end,
}
