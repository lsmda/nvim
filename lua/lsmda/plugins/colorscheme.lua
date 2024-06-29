return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.everforest_better_performance = 1
		vim.g.everforest_background = "soft"
		vim.g.everforest_transparent_background = 2
		vim.g.everforest_disable_terminal_colors = 1
		vim.g.everforest_ui_contrast = "high"
		vim.g.everforest_float_style = "dim"
		vim.cmd.colorscheme("everforest")
	end,
}
