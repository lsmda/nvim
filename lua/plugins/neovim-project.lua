return {
	{
		"coffebar/neovim-project",
		lazy = false,
		priority = 100,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
			{ "Shatur/neovim-session-manager" },
		},
		opts = {
			projects = { -- define project roots
				"~/dev/*",
				"~/.config/*",
			},
		},
		init = function()
			vim.opt.sessionoptions:append("globals")

			local legendary = require("legendary")

			legendary.keymaps({
				{
					description = "Show project list",
					mode = { "n" },
					"<leader>fp",
					":Telescope neovim-project discover<cr>",
				},
				{
					description = "Show project list",
					mode = { "n" },
					"<leader>fh",
					":Telescope neovim-project history<cr>",
				},
			})
		end,
	},
}
