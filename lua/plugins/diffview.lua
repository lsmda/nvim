---@diagnostic disable: undefined-field
return {
  "sindrets/diffview.nvim",
  config = function()
    local diffView = require "diffview"
    local actions = require "diffview.actions"

    vim.keymap.set("n", "<leader>df", diffView.open, { desc = "Open diff view" })
    vim.keymap.set("n", "<leader>dh", diffView.file_history, { desc = "Open diff history" })

    local close = { "n", "<leader>q", "<cmd>tabclose<CR>", { desc = "Close diff view" } }
    local select = { "n", "e", actions.select_entry, { desc = "Open diff for the selected entry" } }
    local toggle = { "n", "<C-e>", actions.toggle_files, { desc = "Toggle file panel" } }

    require("diffview").setup {
      keymaps = {
        view = { close, toggle },
        file_panel = { close, select, toggle },
        file_history_panel = { close, select, toggle },
      },
    }
  end,
}
