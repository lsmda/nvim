return {
	{
		"windwp/nvim-ts-autotag",
	},

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	{
		"mg979/vim-visual-multi",
	},

	{
		"vigoux/notifier.nvim",
		config = function()
			require("notifier").setup({})
		end,
	},

	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings()
		end,
	},

	{
		"axelvc/template-string.nvim",
		config = function()
			require("template-string").setup({})
		end,
	},

	{
		"hinell/duplicate.nvim",
		dependencies = {
			"mrjones2014/legendary.nvim",

			priority = 1000,
			lazy = false,
		},
	},

	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		init = function()
			vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {},
	},

	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-tree/nvim-web-devicons" },
		},
		config = function()
			require("lspsaga").setup({
				ui = {
					border = "rounded",
				},
				diagnostic = {
					show_code_action = true,
					max_height = 0.8,
					max_show_width = 0.7,
				},
			})
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("todo-comments").setup()
			vim.keymap.set("n", "<leader>ft", "<CMD>TodoTelescope<CR>", { desc = "Find todos" })
		end,
	},

	{
		"rmagatti/alternate-toggler",
		event = { "BufReadPost" },
		config = function()
			require("alternate-toggler").setup({
				alternates = {
					["1"] = "0",
					["+"] = "-",
					["=="] = "!=",
					["==="] = "!==",
					[">"] = "<",
					[">="] = "<=",
					[">=="] = "<==",
					["true"] = "false",
					["True"] = "False",
					["TRUE"] = "FALSE",
					["yes"] = "no",
					["Yes"] = "No",
					["YES"] = "NO",
				},
			})

			vim.keymap.set(
				"n",
				"<leader>tt",
				"<cmd>lua require('alternate-toggler').toggleAlternate()<CR>",
				{ desc = "Toggle value" }
			)
		end,
	},

	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup()
			require("mini.comment").setup()
			require("mini.cursorword").setup({
				delay = 250,
			})

			require("mini.indentscope").setup({
				draw = {
					delay = 50,
				},
			})

			require("mini.statusline").setup()

			require("mini.pairs").setup()
			require("mini.splitjoin").setup({
				mappings = {
					toggle = "<leader>j",
					split = "",
					join = "",
				},
			})
		end,
	},
}
