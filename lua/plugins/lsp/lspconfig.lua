return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	commit = "e49b1e90c1781ce372013de3fa93a91ea29fc34a",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap

		local function lsp_keymaps(bufnr)
			local opts = { noremap = true, silent = true }
			keymap.set(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
			keymap.set(bufnr, "n", "k", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
			keymap.set(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
			keymap.set(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
			keymap.set(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		end

		local function on_attach(client, bufnr)
			lsp_keymaps(bufnr)
		end

		local function common_capabilities()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.completion.completionItem.resolveSupport = {
				properties = {
					"documentation",
					"detail",
					"additionalTextEdits",
				},
			}
			return capabilities
		end

		local icons = require("user.icons")

		local servers = {
			"lua_ls",
			"cssls",
			"html",
			"tsserver",
			"astro",
			"pyright",
			"bashls",
			"jsonls",
			"yamlls",
			"marksman",
			"tailwindcss",
		}

		local default_diagnostic_config = {
			signs = {
				active = true,
				values = {
					{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
					{ name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
					{ name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
					{ name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
				},
			},
			virtual_text = false,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}

		vim.diagnostic.config(default_diagnostic_config)

		for _, sign in ipairs(vim.diagnostic.config().signs.values) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
		end

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
		require("lspconfig.ui.windows").default_options.border = "rounded"

		for _, server in ipairs(servers) do
			local opts = {
				on_attach = on_attach,
				capabilities = common_capabilities(),
			}

			local require_ok, settings = pcall(require, "user.lspsettings." .. server)
			if require_ok then
				opts = vim.tbl_deep_extend("force", settings, opts)
			end

			if server == "lua_ls" then
				require("neodev").setup({})
			end

			lspconfig[server].setup(opts)
		end
	end,
}
