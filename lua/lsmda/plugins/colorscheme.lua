return {
	"tinted-theming/base16-vim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.base16_colorspace = 256
		vim.g.base16_background_transparent = 1
		vim.cmd.colorscheme("bubblegum")
	end,
}
