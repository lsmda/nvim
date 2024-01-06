return {
	"neovim/nvim-lspconfig",
	event = { "BufEnter" },
	dependencies = {
		"folke/neodev.nvim",
	},
	config = function()
		require("neodev").setup({})

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

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "<leader>k", ":Lspsaga hover_doc<CR>", opts)

				vim.keymap.set("n", "<leader>r", ":Lspsaga rename<CR>", opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<CR>", opts)

				vim.keymap.set({ "n", "v" }, "<leader>pk", ":Lspsaga peek_definition<CR>", opts)
				vim.keymap.set({ "n", "v" }, "<leader>gd", ":Lspsaga goto_definition<CR>", opts)

				-- Diagnostics
				vim.diagnostic.config({ underline = false })

				local get_diagnostic_opts = function(options)
					options = options or {}
					return {
						border = options.border or "rounded",
						prefix = options.prefix or " ",
						severity_sort = options.severity_sort or true,
						scope = options.scope or "buffer",
						source = options.source or false,
					}
				end

				vim.keymap.set("n", "<leader>dd", function()
					vim.diagnostic.open_float(nil, get_diagnostic_opts())
				end, opts)

				vim.keymap.set("n", "<leader>nd", function()
					vim.diagnostic.goto_next({ float = get_diagnostic_opts({ scope = "line" }) })
				end, opts)

				vim.keymap.set("n", "<leader>pd", function()
					vim.diagnostic.goto_prev({ float = get_diagnostic_opts({ scope = "line" }) })
				end, opts)
			end,
		})
	end,
}
