return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local config = require "nvim-treesitter.configs"

    config.setup {
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
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
    }
  end,
}
