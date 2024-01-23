return {
	"nvim-tree/nvim-tree.lua",
	commit = "f1b3e6a7eb92da492bd693257367d9256839ed3d",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", commit = "a55b801b7ef5719ca25692c3a0a5447fdfb692ed" },
	},
	config = function()
		local on_attach = function(bufnr)
			require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
			require("core.utils").load_mappings("nvim_tree", { buffer = bufnr, nowait = true })
		end

		require("nvim-tree").setup({
			on_attach = on_attach,
			sort = {
				sorter = "name",
			},
			view = {
				width = 35,
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
