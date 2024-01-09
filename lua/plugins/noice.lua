return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		messages = {
			enabled = false,
		},
		notify = {
			enabled = false,
		},
		lsp = {
			progress = {
				enabled = false,
			},
		},
	},
	dependencies = { "MunifTanjim/nui.nvim" },
}
