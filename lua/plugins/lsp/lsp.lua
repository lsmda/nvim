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

		lspconfig.eslint.setup({
			-- on_attach = function(client, bufnr)
			-- 	vim.api.nvim_create_autocmd("BufWritePre", {
			-- 		buffer = bufnr,
			-- 		command = "EslintFixAll",
			-- 	})
			-- end,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local opts = { buffer = ev.buf }

				vim.keymap.set("n", "<leader>k", ":Lspsaga hover_doc<cr>", opts)
				vim.keymap.set("n", "<leader>r", ":Lspsaga rename<cr>", opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<cr>", opts)

				-- Diagnostics
				vim.keymap.set("n", "<leader>dd", ":Lspsaga show_buf_diagnostics<cr>", opts)
				vim.keymap.set("n", "<leader>nd", ":Lspsaga diagnostic_jump_next<cr>", opts)
				vim.keymap.set("n", "<leader>pd", ":Lspsaga diagnostic_jump_prev<cr>", opts)
			end,
		})
	end,
}
