return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"dockerls",
					"graphql",
					"html",
					"jsonls",
					"tsserver",
					"remark_ls",
					"tailwindcss",
					"yamlls",
					"taplo",
					"mdx_analyzer",
					"bashls",
					"astro"
				}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.html.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.yamlls.setup({})
			lspconfig.remark_ls.setup({})
			lspconfig.bashls.setup({})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end
	}
}
