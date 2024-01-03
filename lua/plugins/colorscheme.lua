return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			term_colors = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
			},
			color_overrides = {
				all = {
					-- text = "#F4CDE9",
					surface0 = "#44313B",
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
