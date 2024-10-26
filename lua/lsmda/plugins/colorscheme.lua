return {
	-- "sainnhe/everforest",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	vim.g.everforest_better_performance = 1
	-- 	vim.g.everforest_transparent_background = 2
	-- 	vim.g.everforest_ui_contrast = "high"
	-- 	vim.g.everforest_float_style = "dim"
	-- 	vim.cmd.colorscheme("everforest")
	-- end,

	{
		"mellow-theme/mellow.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.mellow_italic_comments = false
			vim.g.mellow_transparent = true
			vim.cmd.colorscheme("mellow")
		end,
	},
}
