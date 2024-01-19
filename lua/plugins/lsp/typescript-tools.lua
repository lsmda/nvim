return {
	"pmizio/typescript-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local typescript_tools = require("typescript-tools")

		typescript_tools.setup({})

		vim.keymap.set("n", "<leader>m", "<CMD>TSToolsOrganizeImports<CR>")
		vim.keymap.set("n", "<leader>a", "<CMD>TSToolsAddMissingImports<CR>")
	end,
}
