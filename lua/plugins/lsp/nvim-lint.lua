return {
	"mfussenegger/nvim-lint",
	commit = "2cf9ad095130755d7d87f1730bcf33c91ee822e4",
	opts = {
		-- other config
		linters = {
			eslint_d = {
				args = {
					"--no-warn-ignored", -- <-- this is the key argument
					"--format",
					"json",
					"--stdin",
					"--stdin-filename",
					function()
						return vim.api.nvim_buf_get_name(0)
					end,
				},
			},
		},
	},
	config = function()
		require("lint").linters_by_ft = {
			astro = { "eslint_d" },
			css = { "eslint_d" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
