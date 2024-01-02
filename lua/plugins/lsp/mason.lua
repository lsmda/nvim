return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "rounded",
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"html",
				"jsonls",
				"remark_ls",
				"tailwindcss",
				"yamlls",
				"taplo",
				"mdx_analyzer",
				"bashls",
				-- "astro",
				-- "dockerls",
				-- "graphql",
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d", -- js linter
			},
		})
	end,
}
