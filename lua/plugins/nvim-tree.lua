local map = require("config.utils").map

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  opts = function()
    local nvim_tree_api = require "nvim-tree.api"

    -- toggle file explorer when outside of nvim tree
    map("n", "<C-e>", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

    local on_attach = function(bufnr)
      require("nvim-tree.api").config.mappings.default_on_attach(bufnr)

      -- toggle file explorer when in nvim tree
      map("n", "<C-e>", nvim_tree_api.tree.toggle, { desc = "Toggle file explorer", buffer = bufnr, nowait = true })

      -- preview file with file explorer open
      map("n", "e", nvim_tree_api.node.open.preview, { desc = "Open file preview", buffer = bufnr, nowait = true })

      -- noop function to ignore write action
      map("n", "<leader>w", function() end, { desc = "Ignore write on file explorer", buffer = bufnr, nowait = true })

      -- write all buffers and quit
      map("n", "<leader>q", function()
        vim.cmd "wqa"
      end, { desc = "Exit neovim", buffer = bufnr, nowait = true })
    end

    return {
      on_attach = on_attach,
      sort = {
        sorter = "name",
      },
      view = {
        width = 30,
        cursorline = false,
        side = "right",
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
    }
  end,
}
