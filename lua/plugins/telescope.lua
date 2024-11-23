local utils = require "config.utils"
local icons = utils.icons

local M = {}

M.normalize_path = function(path)
  return path:gsub("\\", "/")
end

M.normalize_cwd = function()
  return M.normalize_path(vim.loop.cwd()) .. "/"
end

M.is_subdirectory = function(cwd, path)
  return string.lower(path:sub(1, #cwd)) == string.lower(cwd)
end

M.split_filepath = function(path)
  local normalized_path = M.normalize_path(path)
  local normalized_cwd = M.normalize_cwd()
  local filename = normalized_path:match "[^/]+$"

  if M.is_subdirectory(normalized_cwd, normalized_path) then
    local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
    return stripped_path, filename
  else
    local stripped_path = normalized_path:sub(1, -(#filename + 1))
    return stripped_path, filename
  end
end

M.path_display = function(_, path)
  local stripped_path, filename = M.split_filepath(path)
  if filename == stripped_path or stripped_path == "" then
    return filename
  end
  return string.format("%s @ %s", filename, stripped_path)
end

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find files", silent = true },
    { "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Find by grep string", silent = true },
    { "<leader>fw", "<CMD>Telescope grep_string<CR>", desc = "Find word", silent = true },
    { "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "Find buffers", silent = true },
    { "<leader>fc", "<CMD>Telescope command_history<CR>", desc = "Find commands", silent = true },

    { "<leader>gf", "<CMD>Telescope git_files<CR>", desc = "Git files", silent = true },
    { "<leader>gb", "<CMD>Telescope git_branches<CR>", desc = "Git branches", silent = true },
    { "<leader>gc", "<CMD>Telescope git_commits<CR>", desc = "Git commits", silent = true },
    { "<leader>gs", "<CMD>Telescope git_status<CR>", desc = "Git status", silent = true },
    { "<leader>gx", "<CMD>Telescope git_stash<CR>", desc = "Git stash", silent = true },
  },
  opts = {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "normal",
      preview = true,
      border = true,
      selection_strategy = "reset",
      path_display = M.path_display,
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
  },
}
