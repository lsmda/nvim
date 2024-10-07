return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.everforest_better_performance = 1
		vim.g.everforest_transparent_background = 2
		vim.g.everforest_ui_contrast = "high"
		vim.g.everforest_float_style = "dim"
		vim.cmd.colorscheme("everforest")
	end,

	-- "projekt0n/github-nvim-theme",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	-- 	require("github-theme").setup({
	-- 		options = {
	-- 			transparent = true,
	-- 		},
	-- 	})
	--
	-- 	vim.cmd.colorscheme("github_dark_tritanopia")
	-- end,
}
