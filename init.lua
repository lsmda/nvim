require("core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	change_detection = {
		enabled = true,
		notify = false,
	},
}

vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "ss", ":split<CR>", { desc = "[s]plit [s]creen horizontally" })
vim.keymap.set("n", "sv", ":vsplit<CR>", { desc = "[s]plit screen [v]ertically" })

vim.keymap.set("n", "<CR>", "o<Esc>", { desc = "Add line below cursor" })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

vim.keymap.set("n", "<M-h>", "<C-o>", { desc = "Navigate to previous cursor position" })
vim.keymap.set("n", "<M-l>", "<C-i>", { desc = "Navigate to next cursor position" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<S-M-k>", "<cmd>t .-1<cr>==", { desc = "Duplicate line up" })
vim.keymap.set("n", "<S-M-j>", "<cmd>t .<CR>==", { desc = "Duplicate line down" })

vim.keymap.set("n", "<C-e>", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>", { desc = "Toggle file explorer" })

local confirm_quit = require("core.utils").confirm_quit

-- save file and quit
vim.keymap.set("n", "<leader>w", function()
	require("conform").format()
	vim.cmd("w")
end, { desc = "[w]rite current buffer" })

vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "[q]uit current buffer" })

vim.keymap.set("n", "<leader>Q", function()
	confirm_quit("qa!", "Are you sure you want to quit? Unsaved changes will be lost (y/N): ")
end, { desc = "[Q]uit all open buffers" })

-- move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- resize window
vim.keymap.set("n", "<C-S-h>", "<C-w><")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")
vim.keymap.set("n", "<C-S-k>", "<C-w>+")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")

-- clear search pattern
vim.keymap.set("n", "<leader>cs", function()
	vim.fn.setreg("/", "")
end, { desc = "[c]lear [s]earch pattern" })

-- insert mode navigation
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Navigate left in insert mode" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Navigate right in insert mode" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Navigate down in insert mode" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Navigate up in insert mode" })

vim.keymap.set("i", "'", "''<left>")
vim.keymap.set("i", '"', '""<left>')
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")

vim.keymap.set({ "i", "v" }, "<M-n>", "<Esc>", { desc = "Enter normal mode" })

vim.keymap.set("v", "'", "c''<Esc>P")
vim.keymap.set("v", '"', 'c""<Esc>P')
vim.keymap.set("v", "(", "c()<Esc>P")
vim.keymap.set("v", "[", "c[]<Esc>P")
vim.keymap.set("v", "{", "c{}<Esc>P")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move visual selection up" })
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move visual selection down" })
vim.keymap.set("v", "<S-M-k>", "<cmd>VisualDuplicate -1<CR>", { desc = "selection: duplicate up" })
vim.keymap.set("v", "<S-M-j>", "<cmd>VisualDuplicate +1<CR>", { desc = "selection: duplicate down" })

vim.keymap.set({ "n", "v" }, "<M-e>", "$", { desc = "End of line" })
vim.keymap.set({ "n", "v" }, "<M-q>", "^", { desc = "Beginning of line" })
vim.keymap.set({ "n", "v" }, "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Tmux navigate left command" })
vim.keymap.set({ "n", "v" }, "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Tmux navigate right command" })
vim.keymap.set({ "n", "v" }, "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Tmux navigate down command" })
vim.keymap.set({ "n", "v" }, "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Tmux navigate up command" })

require("lazy").setup({
	-- colorscheme
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_better_performance = 1
			vim.g.everforest_transparent_background = 1
			vim.g.everforest_ui_contrast = "high"
			vim.g.everforest_float_style = "dim"
			vim.cmd.colorscheme("everforest")
		end,
	},

	{
		"windwp/nvim-ts-autotag",
	},

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},

	{
		"hinell/duplicate.nvim",
		dependencies = {
			{
				"mrjones2014/legendary.nvim",
				priority = 10000,
				lazy = false,
			},
		},

		{
			"kdheepak/lazygit.nvim",
			dependencies = {
				{ "nvim-lua/plenary.nvim" },
			},
			init = function()
				vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit window" })
			end,
		},

		{
			"ggandor/leap.nvim",
		},

		{
		"nvim-telescope/telescope.nvim",
			dependencies = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-tree/nvim-web-devicons" },
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "make",
				},
			},
			lazy = false,
			cmd = "Telescope",
			config = function()
				local telescope = require("telescope")
				local actions = require("telescope.actions")
				local builtin = require("telescope.builtin")

				local utils = require("core.utils")
				local icons = utils.icons

				-- Helper functions for custom path_display function
				local function normalize_path(path)
					return path:gsub("\\", "/")
				end

				local function normalize_cwd()
					return normalize_path(vim.loop.cwd()) .. "/"
				end

				local function is_subdirectory(cwd, path)
					return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
				end

				local function split_filepath(path)
					local normalized_path = normalize_path(path)
					local normalized_cwd = normalize_cwd()
					local filename = normalized_path:match("[^/]+$")

					if is_subdirectory(normalized_cwd, normalized_path) then
						local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
						return stripped_path, filename
					else
						local stripped_path = normalized_path:sub(1, -(#filename + 1))
						return stripped_path, filename
					end
				end

				-- Custom path rendering function for telescope
				function path_display(_, path)
					local stripped_path, filename = split_filepath(path)
					if filename == stripped_path or stripped_path == "" then
						return filename
					end
					return string.format("%s ~ %s", filename, stripped_path)
				end

				telescope.setup({
					defaults = {
						prompt_prefix = icons.ui.Telescope .. " ",
						selection_caret = icons.ui.Forward .. " ",
						entry_prefix = "   ",
						initial_mode = "normal",
						preview = true,
						selection_strategy = "reset",
						path_display = path_display,
						color_devicons = true,
						set_env = { ["COLORTERM"] = "truecolor" },
						sorting_strategy = "ascending",
						layout_strategy = "horizontal",
						layout_config = {
							horizontal = {
								prompt_position = "top",
								width = { padding = 0 },
								height = { padding = 0 },
								preview_width = 0.5,
							},
						},
						vimgrep_arguments = {
							"rg",
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
							"--hidden",
							"--glob=!.git/",
						},
						file_ignore_patterns = {
							"^.git/",
							"^pnpm-lock.*",
							"^lazy-lock.json",
							"node_modules/*",
							"build/*",
							".cache/*",
							"^yarn.lock",
							"schema.gql",
						},
					},

					pickers = {
						find_files = {
							initial_mode = "insert",
						},

						live_grep = {
							initial_mode = "insert",
						},

						diagnostics = {
							theme = "dropdown",
						},

						buffers = {
							theme = "dropdown",
							previewer = false,
							mappings = {
								i = {
									["<C-d>"] = actions.delete_buffer,
								},
								n = {
									["<C-d>"] = actions.delete_buffer,
								},
							},
						},

						colorscheme = {
							enable_preview = true,
						},
					},
					extensions = {
						fzf = {
							fuzzy = true, -- false will only do exact matching
							override_generic_sorter = true, -- override the generic sorter
							override_file_sorter = true, -- override the file sorter
							case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						},
					},
				})

				telescope.load_extension("fzf")

				vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
				vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by grep string" })
				vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find string under cursor" })
				vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find references" })
				vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find references" })
				vim.keymap.set("n", "<leader>fc", builtin.command_history, { desc = "Find references" })

				vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
				vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
				vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
				vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
				vim.keymap.set("n", "<leader>gx", builtin.git_stash, { desc = "Git stash" })
			end,
		},

		{
			"nvimdev/lspsaga.nvim",
			dependencies = {
				{ "nvim-treesitter/nvim-treesitter" },
				{ "nvim-tree/nvim-web-devicons" },
			},
			config = function()
				require("lspsaga").setup({
					ui = {
						border = "rounded",
					},
					diagnostic = {
						show_code_action = true,
						max_height = 0.8,
						max_show_width = 0.7,
					},
				})
			end,
		},

		{
			"axelvc/template-string.nvim",
			config = function()
				require("template-string").setup({})
			end,
		},

		{
			"folke/todo-comments.nvim",
			dependencies = {
				{ "nvim-lua/plenary.nvim", commit = "55d9fe89e33efd26f532ef20223e5f9430c8b0c0" },
			},
			config = function()
				require("todo-comments").setup()
				vim.keymap.set("n", "<leader>ft", "<CMD>TodoTelescope<CR>", { desc = "Find todos" })
			end,
		},

		{
			"christoomey/vim-tmux-navigator",
			lazy = false,
		},

		{
			"mg979/vim-visual-multi",
		},

		{
			"vigoux/notifier.nvim",
			config = function()
				require("notifier").setup({})
			end,
		},

		{
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				{ "nvim-tree/nvim-web-devicons" },
			},
			config = function()
				local nvim_tree_api = require("nvim-tree.api")
				local on_attach = function(bufnr)
					require("nvim-tree.api").config.mappings.default_on_attach(bufnr)

					vim.keymap.set(
						"n",
						"?",
						nvim_tree_api.tree.toggle_help,
						{ desc = "Open help", buffer = bufnr, nowait = true }
					)

					vim.keymap.set(
						"n",
						"w",
						nvim_tree_api.node.open.preview,
						{ desc = "Open file preview", buffer = bufnr, nowait = true }
					)

					vim.keymap.set(
						"n",
						"<C-e>",
						nvim_tree_api.tree.toggle,
						{ desc = "Toggle file explorer", buffer = bufnr, nowait = true }
					)

					vim.keymap.set("n", "<Tab>", function()
						nvim_tree_api.node.open.edit()
						nvim_tree_api.tree.toggle({ focus = false })
					end, { desc = "Focus file preview", buffer = bufnr, nowait = true })

					vim.keymap.set("n", "<leader>q", function()
						vim.cmd("wqa")
					end, { desc = "Exit neovim", buffer = bufnr, nowait = true })
				end

				require("nvim-tree").setup({
					on_attach = on_attach,
					sort = {
						sorter = "name",
					},
					view = {
						width = 30,
						cursorline = false,
					},
					actions = {
						open_file = {
							quit_on_open = true,
						},
					},
					update_focused_file = {
						enable = true,
						update_cwd = true,
					},
					filters = {
						dotfiles = false, -- Show dotfiles
						exclude = { ".env" },
					},
					git = {
						enable = true,
					},
					diagnostics = {
						enable = true,
						show_on_dirs = true,
						icons = {
							hint = "",
							info = "",
							warning = "",
							error = "",
						},
					},
				})
			end,
		},
		config = function()
			local legendary = require("legendary")
			legendary.keymaps({
				{ description = "line: duplicate up", mode = { "n" }, "<S-M-k>", "<cmd>t .-1<cr>==" },
				{ description = "Line: duplicate down", mode = { "n" }, "<S-M-j>", "<cmd>t .<CR>==" },
				{ description = "Selection: duplicate up", mode = { "v" }, "<S-M-j>", "<cmd>VisualDuplicate +1<CR>" },
				{ description = "Selection: duplicate down", mode = { "v" }, "<S-M-k>", "<cmd>VisualDuplicate -1<cr>" },
			})
		end,
	},

	{
		"rmagatti/alternate-toggler",
		event = { "BufReadPost" },
		config = function()
			require("alternate-toggler").setup({
				alternates = {
					["1"] = "0",
					["+"] = "-",
					["=="] = "!=",
					["==="] = "!==",
					[">"] = "<",
					[">="] = "<=",
					[">=="] = "<==",
					["true"] = "false",
					["True"] = "False",
					["TRUE"] = "FALSE",
					["yes"] = "no",
					["Yes"] = "No",
					["YES"] = "NO",
				},
			})

			vim.keymap.set(
				"n",
				"<leader>tt",
				"<cmd>lua require('alternate-toggler').toggleAlternate()<CR>",
				{ desc = "Toggle value" }
			)
		end,
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			{ "nvim-lua/plenary.nvim", commit = "55d9fe89e33efd26f532ef20223e5f9430c8b0c0" },
		},
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})

			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = false,
						layout_config = {
							horizontal = {
								width = 0.5,
								height = 0.5,
							},
						},
					})
					:find()
			end

			vim.keymap.set("n", "<C-w>", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harpoon window" })

			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():append()
			end)

			vim.keymap.set("n", "<leader>hr", function()
				harpoon:list():remove()
			end)

			vim.keymap.set("n", "<leader>hc", function()
				harpoon:list():clear()
			end)

			vim.keymap.set("n", "<leader>hn", function()
				harpoon:list():next()
			end)

			vim.keymap.set("n", "<leader>hp", function()
				harpoon:list():prev()
			end)

			vim.keymap.set("n", "<S-h>", function()
				harpoon:list():select(1)
			end)

			vim.keymap.set("n", "<S-j>", function()
				harpoon:list():select(2)
			end)

			vim.keymap.set("n", "<S-k>", function()
				harpoon:list():select(3)
			end)

			vim.keymap.set("n", "<S-l>", function()
				harpoon:list():select(4)
			end)

			vim.keymap.set("n", "<S-b>", function()
				harpoon:list():select(5)
			end)

			vim.keymap.set("n", "<S-n>", function()
				harpoon:list():select(6)
			end)

			vim.keymap.set("n", "<S-m>", function()
				harpoon:list():select(7)
			end)

			vim.keymap.set("n", "<S-,>", function()
				harpoon:list():select(8)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<C-S-P>", function()
				harpoon:list():prev()
			end)

			vim.keymap.set("n", "<C-S-N>", function()
				harpoon:list():next()
			end)
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

	{
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		cmd = "Gitsigns",
		config = function()
			local icons = require("core.utils").icons

			require("gitsigns").setup({
				signs = {
					add = {
						hl = "GitSignsAdd",
						text = icons.ui.BoldLineLeft,
						numhl = "GitSignsAddNr",
						linehl = "GitSignsAddLn",
					},
					change = {
						hl = "GitSignsChange",
						text = icons.ui.BoldLineLeft,
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = icons.ui.TriangleShortArrowRight,
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = icons.ui.TriangleShortArrowRight,
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = icons.ui.BoldLineLeft,
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
					delay = 1500,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
				current_line_blame_formatter = "<author>, <author_time:%d-%m-%Y> <summary>",
				update_debounce = 200,
				max_file_length = 40000,
				preview_config = {
					border = "rounded",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},

	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup()
			require("mini.comment").setup()
			require("mini.cursorword").setup({
				delay = 250,
			})
			require("mini.indentscope").setup()

			require("mini.statusline").setup()

			require("mini.pairs").setup()
			require("mini.splitjoin").setup({
				mappings = {
					toggle = "<leader>j",
					split = "",
					join = "",
				},
			})
		end,
	},

	-- LSP config
	{
		"stevearc/conform.nvim",
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
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
			},
			notify_on_error = true,
		},
		init = function()
			require("conform").setup({})
		end,
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			{ "neovim/nvim-lspconfig", commit = "fe1484034f47cf064c6bfd10ef1ff26665a08fd2" },
			{ "williamboman/mason-lspconfig.nvim", commit = "56e435e09f8729af2d41973e81a0db440f8fe9c9" },
			{ "whoissethdaniel/mason-tool-installer.nvim", commit = "bf0f4f8062d3acbe0afcc61db01a4d19d96310e4" },
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"cssls",
					"tailwindcss",
					"astro",
					"eslint",
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"stylua",
					"eslint_d",
					"prettierd",
				},
			})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "onsails/lspkind.nvim" },
			{ "windwp/nvim-autopairs" },
			{ "windwp/nvim-ts-autotag" },
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"rafamadriz/friendly-snippets",
				},
			},
		},
		config = function()
			local lspkind = require("lspkind")
			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local luasnip = require("luasnip")

			-- Integrate nvim-autopairs with cmp
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			require("nvim-autopairs").setup()

			-- Integrate nvim-autopairs with cmp
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			-- Load snippets
			require("luasnip.loaders.from_vscode").lazy_load()

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
					{ name = "buffer", max_item_count = 5 }, -- text within current buffer
					{ name = "path", max_item_count = 3 }, -- file system paths
					{ name = "luasnip", max_item_count = 3 }, -- snippets
				}),
				-- Enable pictogram icons for lsp/autocompletion
				formatting = {
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
		"neovim/nvim-lspconfig",
		event = { "BufReadPost" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
		dependencies = {
			{ "j-hui/fidget.nvim", tag = "legacy" },
		},
		config = function()
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

			local get_float_opts = require("core.utils").get_float_opts

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.diagnostic.config({ underline = false })
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to definition" })
					vim.keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover documentation" })
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename buffer instances" })
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
					vim.keymap.set("n", "<leader>pk", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" })

					vim.keymap.set("n", "<leader>dd", function()
						vim.diagnostic.open_float(nil, get_float_opts())
					end, { desc = "Show diagnostics" })

					vim.keymap.set("n", "<leader>nd", function()
						vim.diagnostic.goto_next({ float = get_float_opts({ scope = "line" }) })
					end, { desc = "Next diagnostic" })

					vim.keymap.set("n", "<leader>pd", function()
						vim.diagnostic.goto_prev({ float = get_float_opts({ scope = "line" }) })
					end, { desc = "Previous diagnostic" })
				end,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local config = require("nvim-treesitter.configs")

			config.setup({
				auto_install = true,
				ensure_installed = { "lua", "markdown", "markdown_inline" },
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
			})
		end,
	},

	{
		"pmizio/typescript-tools.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "neovim/nvim-lspconfig" },
		},
		config = function()
			require("typescript-tools").setup({})

			vim.keymap.set("n", "<leader>m", "<cmd>TSToolsOrganizeImports<CR>", { desc = "Organize imports" })
			vim.keymap.set("n", "<leader>a", "<cmd>TSToolsAddMissingImports<CR>", { desc = "Add missing imports" })
		end,
	},
}, opts)
