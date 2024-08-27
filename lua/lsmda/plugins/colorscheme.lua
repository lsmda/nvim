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
		"cdmill/neomodern.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("neomodern").setup({
				style = "roseprime",
				transparent = true, -- don't set background
				term_colors = true, -- if true enable the terminal
			})
			require("neomodern").load()
		end,
	},
}
