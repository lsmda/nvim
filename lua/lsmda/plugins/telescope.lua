return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		lazy = false,
		cmd = "Telescope",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			local utils = require("lsmda.core.utils")
			local icons = utils.icons

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
			local path_display = function(_, path)
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
							preview_cutoff = 0,
						},
					},
					vimgrep_arguments = {
						"rg",
						"--hidden",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
					},
					file_ignore_patterns = {
						"--follow",
						"--no-ignore",
						"node_modules",
						"Library",
						"logs",
						"/media",
						"/static",
						"/sites",
						"cache",
						"undo/",
						"backups/",
						"automatic_backups/",
						"autoload/",
						".idea/",
						".git",
						".DS_Store",
						'"*.pyc"',
						'"*.compiled"',
						'"*.scss"',
						"^pnpm-lock.*",
						"^lazy-lock.json",
						"build",
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
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find word" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fc", builtin.command_history, { desc = "Find commands" })

			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
			vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
			vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
			vim.keymap.set("n", "<leader>gx", builtin.git_stash, { desc = "Git stash" })
		end,
	},
}
