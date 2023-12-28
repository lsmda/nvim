return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.diagnostics.eslint,
				},
			})

			-- Write to file and format on save
			vim.keymap.set("n", "<C-s>", function()
				vim.cmd(":wa")
				vim.lsp.buf.format()
			end, {})
		end,
	},
}
