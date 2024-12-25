return {
  "echasnovski/mini.nvim",
  init = function()
    local modules = {
      ai = {},
      comment = {},
      cursorword = { delay = 350 },
      indentscope = { draw = { delay = 50 } },
      pairs = {},
      splitjoin = { mappings = { toggle = "<leader>j", split = "", join = "" } },
      statusline = {},
    }

    for module, opts in pairs(modules) do
      require("mini" .. "." .. module).setup(opts)
    end

    local highlightColor = "#333333"
    vim.api.nvim_set_hl(0, "MiniCursorword", { bg = highlightColor })
    vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = highlightColor })
  end,
}
