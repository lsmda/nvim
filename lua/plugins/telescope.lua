return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"BurntSushi/ripgrep",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	lazy = false,
	cmd = "Telescope",
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		local icons = require("user.icons")

		-- helper functions for custom path_display function
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

		-- custom path rendering function for telescope
		local function path_display(_, path)
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
				mappings = {
					n = {
						-- vim-illuminate removes ability to close picker with remap,
						-- so we explicitly define a mapping here to fix that behavior
						["<M-n>"] = actions.close,
					},
				},
			},
			pickers = {
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

				planets = {
					show_pluto = true,
					show_moon = true,
				},

				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,              -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case",  -- or "ignore_case" or "respect_case"
				},
			},
		})

		telescope.load_extension("fzf")

		local opts = { noremap = true, silent = true }

		-- grep
		vim.keymap.set("n", "<leader><space>", builtin.find_files, opts)
		vim.keymap.set("n", "<leader>fw", builtin.live_grep, opts)
		vim.keymap.set("n", "<leader>fs", builtin.grep_string, opts)
		vim.keymap.set("n", "<leader>fr", builtin.lsp_references, opts)
		vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, opts)
		-- vim.keymap.set("n", "<leader>fd", builtin.lsp_declarations, opts)
		vim.keymap.set("n", "<leader>ft", builtin.lsp_type_definitions, opts)

		-- git
		vim.keymap.set("n", "<leader>gf", builtin.git_files, opts)
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, opts)
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, opts)
		vim.keymap.set("n", "<leader>gs", builtin.git_status, opts)
		vim.keymap.set("n", "<leader>gx", builtin.git_stash, opts)

		-- buffer
		vim.keymap.set("n", "<leader>bf", builtin.buffers, opts)
	end,
}
