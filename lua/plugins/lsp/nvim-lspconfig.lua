return {
	"neovim/nvim-lspconfig",
	commit = "fe1484034f47cf064c6bfd10ef1ff26665a08fd2",
	event = { "BufEnter" },
	config = function()
		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig.eslint.setup({})
		lspconfig.tailwindcss.setup({})
		lspconfig.cssls.setup({})
		lspconfig.astro.setup({})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				vim.diagnostic.config({ underline = false })
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				require("core.utils").load_mappings("lspconfig", { buffer = ev.buf })
			end,
		})
	end,
}
