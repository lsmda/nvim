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

			vim.keymap.set("n", "<c-w>", api.tree.toggle, opts("Toggle file explorer"))
			vim.keymap.set("n", "<space>", api.node.open.preview, opts("Open file preview"))
			vim.keymap.set("n", "<TAB>", function()
				api.node.open.edit()
				api.tree.toggle({ focus = false })
			end, opts("Focus file preview"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
		end

		nvim_tree.setup({
			on_attach = on_attach,
			sort = {
				sorter = "name",
			},
			view = {
				width = 38,
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

		vim.keymap.set("n", "<c-w>", function()
			require("nvim-tree.api").tree.toggle()
		end)
	end,
}
