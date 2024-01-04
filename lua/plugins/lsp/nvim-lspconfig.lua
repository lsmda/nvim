return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
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
				vim.keymap.set("n", "<leader>dd", ":Lspsaga show_buf_diagnostics<CR>", opts)
				vim.keymap.set("n", "<leader>nd", ":Lspsaga diagnostic_jump_next<CR>", opts)
				vim.keymap.set("n", "<leader>pd", ":Lspsaga diagnostic_jump_prev<CR>", opts)
			end,
		})
	end,
}
