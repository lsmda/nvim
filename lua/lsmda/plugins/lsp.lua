return {
	{ -- LSP
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim

			{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- Allows extra capabilities provided by nvim-cmp
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local get_float_opts = require("lsmda.core.utils").get_float_opts

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc, silent = true })
					end

					local builtin = require("telescope.builtin")

					map("<leader>gd", builtin.lsp_definitions, "Go to definition")
					map("<leader>gr", builtin.lsp_references, "Go to references")
					map("<leader>gi", builtin.lsp_implementations, "Go to implementation")
					map("<leader>D", builtin.lsp_type_definitions, "Type definition")
					map("<leader>ds", builtin.lsp_document_symbols, "Document symbols")
					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code action")
					map("<leader>K", "<cmd>Lspsaga hover_doc<CR>", "Display documentation")
					map("<leader>pk", "<cmd>Lspsaga peek_definition<CR>", "Peek definition")

					map("<leader>dd", function()
						vim.diagnostic.open_float(nil, get_float_opts())
					end, "Display diagnostics")

					map("<leader>nd", function()
						vim.diagnostic.goto_next({ float = get_float_opts({ scope = "line" }) })
					end, "Next diagnostic")

					map("<leader>pd", function()
						vim.diagnostic.goto_prev({ float = get_float_opts({ scope = "line" }) })
					end, "Previous diagnostic")
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				tsserver = {},
				cssls = {},
				tailwindcss = {},
				astro = {},
				graphql = {},
				html = {},
				pyright = {},
				eslint = {},
				nil_ls = {},
				gopls = {},

				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = {
								globals = { "vim" },
								disable = { "missing-fields" },
							},
						},
					},
				},
			}

			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})

			vim.list_extend(ensure_installed, {
				"stylua",
				"eslint_d",
				"prettierd",
				"crlfmt",
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			notify_on_error = false,
			formatters_by_ft = {
				css = { "prettierd" },
				graphql = { "prettierd" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				lua = { "stylua" },
				markdown = { "prettierd" },
				nix = { "alejandra" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				yaml = { "prettierd" },
				go = { "crlfmt" },
				gomod = { "crlfmt" },
				-- You can use 'stop_after_first' to run the first available formatter from the list
				python = { "isort", "black", stop_after_first = true },
			},
		},
	},

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter" },
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			"windwp/nvim-autopairs",
			{ "hrsh7th/cmp-cmdline" },
			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			require("nvim-autopairs").setup({
				check_ts = true,
			})

			-- Integrate nvim-autopairs with cmp
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			-- Load snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			luasnip.config.setup()

			local check_backspace = function()
				local col = vim.fn.col(".") - 1
				return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
			end

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<C-e>"] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expandable() then
							luasnip.expand()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif check_backspace() then
							fallback()
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, {
						"i",
						"s",
					}),
				}),
				confirm_opts = {
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				},
				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- lsp
					{ name = "luasnip", max_item_count = 3 }, -- snippets
					{ name = "path", max_item_count = 3 }, -- file system paths
					{ name = "buffer", max_item_count = 3 }, -- text within current buffer
				}),
				formatting = {
					fields = {
						"abbr",
						"kind",
						"menu",
					},
					expandable_indicator = true,
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
				experimental = {
					ghost_text = false,
				},
			})

			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" },
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "cmdline" },
				}),
			})
		end,
	},

	{
		"mfussenegger/nvim-lint",
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
				css = { "eslint_d" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local config = require("nvim-treesitter.configs")

			---@diagnostic disable-next-line: missing-fields
			config.setup({
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-Space>",
						node_incremental = "<C-Space>",
						scope_incremental = false,
						node_decremental = "<BS>",
					},
				},
				autotag = {
					enable = true,
				},
				ensure_installed = {
					"lua",
					"markdown",
					"markdown_inline",
					"json",
					"javascript",
					"typescript",
					"dockerfile",
					"tsx",
					"yaml",
					"graphql",
				},
			})
		end,
	},

	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = { "BufEnter" },
		config = function()
			-- Turn on LSP, formatting, and linting status and progress information
			require("fidget").setup({
				text = {
					spinner = "dots_negative",
				},
			})
		end,
	},
}
