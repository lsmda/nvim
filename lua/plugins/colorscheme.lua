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
				nvimtree = true,
				treesitter = true,
				notify = true,
				lsp_saga = true,
				mason = false,
				mini = {
					enabled = true,
					indentscope_color = "surface1",
				},
				telescope = { enabled = true },
				native_lsp = { enabled = true },
			},
			custom_highlights = function(colors)
				return {
					Comment = { fg = colors.overlay0 },
					TabLineSel = { bg = colors.pink },
					CmpBorder = { fg = colors.surface2 },
					GitSignsCurrentLineBlame = { fg = colors.overlay0 },
				}
			end,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
