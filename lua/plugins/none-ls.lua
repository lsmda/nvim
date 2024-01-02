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

			-- Format current buffer and write to file
			vim.keymap.set("n", "<C-s>", function()
				vim.lsp.buf.format()
				vim.cmd(":w")
			end, {})
		end,
	},
}
