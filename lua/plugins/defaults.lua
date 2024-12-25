return {
  {
    "vigoux/notifier.nvim",
    lazy = true,
    opts = {},
  },

  {
    "stevearc/dressing.nvim",
    opts = {},
  },

  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
  },

  {
    "hinell/duplicate.nvim",
    keys = {
      { "<S-M-k>", "<CMD>VisualDuplicate -1<CR>", desc = "Duplicate selection up", mode = "x" },
      { "<S-M-j>", "<CMD>VisualDuplicate +1<CR>", desc = "Duplicate selection down", mode = "x" },
    },
    dependencies = {
      "mrjones2014/legendary.nvim",
      priority = 1000,
    },
  },

  {
    "axelvc/template-string.nvim",
    lazy = true,
    opts = {},
  },

  {
    "windwp/nvim-ts-autotag", -- auto add closing tags for html and jsx
    lazy = true,
    opts = {},
  },

  {
    "ggandor/leap.nvim",
    lazy = true,
    keys = {
      { "s", "<Plug>(leap-forward-to)" },
      { "S", "<Plug>(leap-backward-to)}" },
    },
  },
}
