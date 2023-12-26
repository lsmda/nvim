return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
			vim.keymap.set("n", "<C-g>", builtin.git_files, {})

			vim.keymap.set("n", "<C-r>", builtin.lsp_references, {})
		end
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {},
						require("telescope.themes").get_cursor {},
						require("telescope.themes").get_ivy {},
					}
				}
			})
			require("telescope").load_extension("ui-select")
		end
	}
}
