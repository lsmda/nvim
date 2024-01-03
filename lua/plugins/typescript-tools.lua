return {
	"pmizio/typescript-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local typescript_tools = require("typescript-tools")

		typescript_tools.setup({})

		vim.keymap.set("n", "<leader>m", "<cmd>TSToolsOrganizeImports<cr>")
		vim.keymap.set("n", "<leader>a", "<cmd>TSToolsAddMissingImports<cr>")

		local api = require("typescript-tools.api")
		require("typescript-tools").setup({
			handlers = {
				["textDocument/publishDiagnostics"] = api.filter_diagnostics({ 6133 }),
			},
		})
	end,
}
