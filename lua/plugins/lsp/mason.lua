return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"whoissethdaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"cssls",
				"tailwindcss",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"eslint",
				"eslint_d",
				"prettier",
				"prettierd",
			},
		})
	end,
}
