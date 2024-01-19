return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("lazy").setup({})

		local utils = require("core.utils")
		local map = utils.map

		map("n", "<leader>gg", "<cmd>LazyGit<CR>")
	end,
}
