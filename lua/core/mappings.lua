-- n, v, i, t = mode names

local M = {}

local nvim_tree_api = require("nvim-tree.api")
local confirm_quit = require("core.utils").confirm_quit

M.general = {
	n = {
		["<CR>"] = { "o<Esc>", "Add line below cursor" },
		["<C-a>"] = { "ggVG", "Select all" },

		["<M-h>"] = { "<C-o>", "Navigate to previous cursor position" },
		["<M-l>"] = { "<C-i>", "Navigate to next cursor position" },

		["<C-d>"] = { "<C-d>zz", "Scroll down" },
		["<C-u>"] = { "<C-u>zz", "Scroll up" },

		["<M-k>"] = { ":m .-2<CR>==", "Move line up" },
		["<M-j>"] = { ":m .+1<CR>==", "Move line down" },

		["<C-w>"] = { nvim_tree_api.tree.toggle, "Toggle file explorer" },

		["<C-s>"] = {
			function()
				require("conform").format()
				vim.cmd("wa")
			end,
			"Format current buffer and write all open buffers",
		},

		["<leader>s"] = {
			function()
				confirm_quit("wqa", nil, true)
			end,
			"Write all open buffers then exit neovim",
		},

		["<leader>q"] = {
			function()
				confirm_quit("qa!", "Are you sure you want to quit? Unsaved changes will be lost (y/N): ")
			end,
			"Ignore all open buffers then prompt user to exit neovim",
		},

		["<leader>cs"] = {
			function()
				vim.fn.setreg("/", "")
			end,
			"Clear search pattern",
		},
	},

	i = {
		-- Navigate within insert mode
		["<C-h>"] = { "<Left>", "Navigate left in insert mode" },
		["<C-l>"] = { "<Right>", "Navigate right in insert mode" },
		["<C-j>"] = { "<Down>", "Navigate down in insert mode" },
		["<C-k>"] = { "<Up>", "Navigate up in insert mode" },

		-- Close character pair and move cursor inside
		["'"] = { "''<left>" },
		['"'] = { '""<left>' },
		["("] = { "()<left>" },
		["["] = { "[]<left>" },
		["{"] = { "{}<left>" },
	},

	v = {
		-- Enclose visual selection with character pair
		["'"] = { "c''<Esc>P" },
		['"'] = { 'c""<Esc>P' },
		["("] = { "c()<Esc>P" },
		["["] = { "c[]<Esc>P" },
		["{"] = { "c{}<Esc>P" },

		["<M-k>"] = { ":m '<-2<CR>gv=gv", "Move visual selection up" },
		["<M-j>"] = { ":m '>+1<CR>gv=gv", "Move visual selection down" },
	},

	[{ "i", "v" }] = {
		["<M-n>"] = { "<Esc>", "Enter normal mode" },
	},

	[{ "n", "v" }] = {
		["<M-e>"] = { "$", "End of line" },
		["<M-q>"] = { "^", "Beginning of line" },

		-- Pane navigation
		["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "Tmux navigate left command" },
		["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "Tmux navigate right command" },
		["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "Tmux navigate down command" },
		["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "Tmux navigate up command" },
	},
}

M.alternate_toggler = {
	plugin = true,

	n = {
		["<leader>tt"] = { "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>", "Toggle value" },
	},
}

M.lazygit = {
	plugin = true,

	n = {
		["<leader>gg"] = { "<cmd>LazyGit<CR>", "Open LazyGit window" },
	},
}

local get_float_opts = require("core.utils").get_float_opts

M.lspconfig = {
	plugin = true,

	n = {
		["<leader>gd"] = { "<cmd>Lspsaga goto_definition<CR>", "Go to definition" },
		["<leader>k"] = { "<cmd>Lspsaga hover_doc<CR>", "Go to definition" },
		["<leader>rn"] = { vim.lsp.buf.rename, "Rename buffer instances" },
		["<leader>ca"] = { vim.lsp.buf.code_action, "Code actions" },
		["<leader>pk"] = { "<cmd>Lspsaga peek_definition<CR>", "Peek definition" },

		["<leader>dd"] = {
			function()
				vim.diagnostic.open_float(nil, get_float_opts())
			end,
			"Show diagnostics",
		},
		["<leader>nd"] = {
			function()
				vim.diagnostic.goto_next({ float = get_float_opts({ scope = "line" }) })
			end,
			"Next diagnostic",
		},
		["<leader>pd"] = {
			function()
				vim.diagnostic.goto_prev({ float = get_float_opts({ scope = "line" }) })
			end,
			"Previous diagnostic",
		},
	},
}

M.nvim_tree = {
	plugin = true,

	n = {
		["?"] = { nvim_tree_api.tree.toggle_help, "Open help" },
		["w"] = { nvim_tree_api.node.open.preview, "Open file preview" },
		["<C-w>"] = { nvim_tree_api.tree.toggle, "Toggle file explorer" },

		["<Tab>"] = {
			function()
				nvim_tree_api.node.open.edit()
				nvim_tree_api.tree.toggle({ focus = false })
			end,
			"Focus file preview",
		},

		["<leader>q"] = {
			function()
				vim.cmd("wqa")
			end,
			"Exit neovim",
		},
	},
}

local builtin = require("telescope.builtin")

M.telescope = {
	plugin = true,

	n = {
		["<leader>ff"] = { builtin.find_files, "Find files" },
		["<leader>fg"] = { builtin.live_grep, "Find by grep string" },
		["<leader>fs"] = { builtin.live_grep, "Find string under cursor" },
		["<leader>fr"] = { builtin.lsp_references, "Find references" },
		["<leader>fb"] = { builtin.buffers, "Find references" },
		["<leader>fc"] = { builtin.command_history, "Find references" },

		["<leader>gf"] = { builtin.git_files, "Git files" },
		["<leader>gb"] = { builtin.git_branches, "Git branches" },
		["<leader>gc"] = { builtin.git_commits, "Git commits" },
		["<leader>gs"] = { builtin.git_status, "Git status" },
		["<leader>gx"] = { builtin.git_stash, "Git stash" },
	},
}

M.todo_comments = {
	plugin = true,

	n = {
		["<leader>ft"] = { "<CMD>TodoTelescope<CR>", "Find todos" },
	},
}

M.typescript_tools = {
	plugin = true,

	n = {
		["<leader>m"] = { "<cmd>TSToolsOrganizeImports<CR>", "Organize imports" },
		["<leader>a"] = { "<cmd>TSToolsAddMissingImports<CR>", "Add missing imports" },
	},
}

return M
