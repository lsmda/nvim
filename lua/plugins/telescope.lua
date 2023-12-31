return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			telescope.setup({})

			telescope.load_extension("fzf")

			vim.keymap.set("n", "<leader><space>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
			vim.keymap.set("n", "<leader>fc", builtin.grep_string, {})
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
