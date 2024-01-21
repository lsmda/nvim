return {
	"kdheepak/lazygit.nvim",
	commit = "1e08e3f5ac1152339690140e61a4a32b3bdc7de5",
	dependencies = {
		{ "nvim-lua/plenary.nvim", commit = "55d9fe89e33efd26f532ef20223e5f9430c8b0c0" },
	},
	config = function()
		local utils = require("core.utils")
		local map = utils.map

		map("n", "<leader>gg", "<cmd>LazyGit<CR>")
	end,
}
