return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			-- lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			graphql = { "prettierd" },
			astro = { "prettierd" },
		},
		-- format_on_save = {
		-- 	lsp_fallback = true,
		-- 	timeout_ms = 501,
		-- },
		notify_on_error = true,
	},
	init = function()
		require("conform").setup({})
	end,
}
