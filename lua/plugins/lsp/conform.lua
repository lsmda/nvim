return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			html = { "eslint_d" },
			css = { "eslint_d" },
			json = { "prettier", "prettierd" },
			yaml = { "eslint_d" },
			markdown = { "eslint_d" },
			graphql = { "eslint_d" },
		},
		-- format_on_save = {
		-- 	lsp_fallback = true,
		-- 	timeout_ms = 500,
		-- },
		notify_on_error = true,
	},
	init = function()
		require("conform").setup()
	end,
}
