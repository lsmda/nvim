return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvim_tree = require("nvim-tree")

		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "<c-w>", api.tree.toggle, opts("Toggle"))
			vim.keymap.set("n", "<space>", api.node.open.preview, opts("Help"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
		end

		nvim_tree.setup({
			on_attach = on_attach,
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 35,
			},
			filters = {
				custom = { "^.git$" },
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
			git = {
				enable = true,
				timeout = 400,
				show_on_dirs = false,
				cygwin_support = true,
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
