return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
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
