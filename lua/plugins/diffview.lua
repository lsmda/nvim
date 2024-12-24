return {
  "sindrets/diffview.nvim",
  lazy = true,
  keys = {
    { "<leader>df", '<CMD>DiffviewOpen"<CR>', desc = "Open git diff view" },
    { "<leader>dh", "<CMD>DiffviewFileHistory<CR>", desc = "Open git diff history" },
  },
  opts = function()
    local actions = require "diffview.actions"

    local close = { "n", "<leader>q", "<CMD>tabclose<CR>", { desc = "Close diff view" } }
    local select = { "n", "e", actions.select_entry, { desc = "Open diff for the selected entry" } }
    local toggle = { "n", "<C-e>", actions.toggle_files, { desc = "Toggle file panel" } }

    return {
      keymaps = {
        view = { close, toggle },
        file_panel = { close, select, toggle },
        file_history_panel = { close, select, toggle },
      },
    }
  end,
}
