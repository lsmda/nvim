return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSupdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			ensure_installed = {
				"lua",
				"tsx",
				"typescript",
				"javascript",
				"html",
				"css",
				"json",
				"graphql",
				"regex",
				"markdown",
				"markdown_inline",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-Space>",
					node_incremental = "<C-Space>",
					scope_incremental = false,
					node_decremental = "<BS>",
				},
			},
			autotag = {
				enable = true,
			},
		})

		local opt = vim.opt

		opt.foldmethod = "expr"
		opt.foldexpr = "nvim_treesitter#foldexpr()"
		opt.foldenable = false
	end,
}
