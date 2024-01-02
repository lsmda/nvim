return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	commit = "3bd2ab64b5d63b29e05691e624927e5ebbf0fb86",
	config = function()
		require("illuminate").configure({
			filetypes_denylist = {
				"mason",
				"harpoon",
				"dressinginput",
				"neogitcommitmessage",
				"qf",
				"dirvish",
				"minifiles",
				"fugitive",
				"alpha",
				"nvimtree",
				"lazy",
				"neogitstatus",
				"trouble",
				"netrw",
				"lir",
				"diffviewfiles",
				"outline",
				"jaq",
				"spectre_panel",
				"toggleterm",
				"dressingselect",
				"telescopeprompt",
			},
		})
	end,
}
