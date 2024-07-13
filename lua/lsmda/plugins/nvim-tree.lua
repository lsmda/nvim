return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local nvim_tree_api = require("nvim-tree.api")
		local on_attach = function(bufnr)
			require("nvim-tree.api").config.mappings.default_on_attach(bufnr)

			vim.keymap.set(
				"n",
				"?",
				nvim_tree_api.tree.toggle_help,
				{ desc = "Open help", buffer = bufnr, nowait = true }
			)

			vim.keymap.set(
				"n",
				"e",
				nvim_tree_api.node.open.preview,
				{ desc = "Open file preview", buffer = bufnr, nowait = true }
			)

			vim.keymap.set(
				"n",
				"<C-e>",
				nvim_tree_api.tree.toggle,
				{ desc = "Toggle file explorer", buffer = bufnr, nowait = true }
			)

			vim.keymap.set("n", "<Tab>", function()
				nvim_tree_api.node.open.edit()
				nvim_tree_api.tree.toggle({ focus = false })
			end, { desc = "Focus file preview", buffer = bufnr, nowait = true })

			vim.keymap.set("n", "<leader>q", function()
				vim.cmd("wqa")
			end, { desc = "Exit neovim", buffer = bufnr, nowait = true })
		end

		require("nvim-tree").setup({
			on_attach = on_attach,
			sort = {
				sorter = "name",
			},
			view = {
				width = 30,
				cursorline = false,
				side = "right",
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			filters = {
				dotfiles = false, -- Show dotfiles
				exclude = { ".env" },
			},
			git = {
				enable = true,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
		})
	end,
}
