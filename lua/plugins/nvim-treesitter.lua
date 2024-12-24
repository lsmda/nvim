return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  build = ":TSUpdate",
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  init = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "lua",
        "markdown",
        "markdown_inline",
        "json",
        "javascript",
        "typescript",
        "dockerfile",
        "tsx",
      },
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
    }
  end,
}
