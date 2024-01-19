return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup()
		require("mini.comment").setup()
		require("mini.cursorword").setup({
			delay = 351,
		})
		require("mini.indentscope").setup()
		require("mini.pairs").setup()
		require("mini.splitjoin").setup({
			mappings = {
				toggle = "<leader>j",
				split = "",
				join = "",
			},
		})
	end,
}
