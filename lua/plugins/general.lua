---@diagnostic disable: undefined-field
return {
  {
    -- automatically add closing tags for html and jsx
    "windwp/nvim-ts-autotag",
    lazy = true,
    opts = {},
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "stevearc/dressing.nvim",
    lazy = true,
  },

  {
    "mg979/vim-visual-multi",
    lazy = true,
  },

  {
    "vigoux/notifier.nvim",
    opts = {},
  },

  {
    "ggandor/leap.nvim",
    keys = {
      { "s", "<Plug>(leap-forward-to)" },
      { "S", "<Plug>(leap-backward-to)}" },
    },
  },

  {
    "axelvc/template-string.nvim",
    lazy = true,
    opts = {},
  },

  {
    "hinell/duplicate.nvim",
    dependencies = {
      "mrjones2014/legendary.nvim",
      priority = 1000,
      lazy = false,
    },
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
    },
  },

  {
    "folke/todo-comments.nvim",
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>ft", "<CMD>TodoTelescope<CR>", desc = "Find todos" },
    },
  },

  {
    "rmagatti/alternate-toggler",
    event = { "BufReadPost" },
    lazy = true,
    keys = {
      {
        "<leader>tt",
        "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>",
        desc = "Toggle value",
        silent = true,
      },
    },
    config = function()
      require("alternate-toggler").setup {
        alternates = {
          ["1"] = "0",
          ["+"] = "-",
          ["=="] = "!=",
          ["==="] = "!==",
          [">"] = "<",
          [">="] = "<=",
          [">=="] = "<==",
          ["true"] = "false",
          ["True"] = "False",
          ["TRUE"] = "FALSE",
          ["yes"] = "no",
          ["Yes"] = "No",
          ["YES"] = "NO",
        },
      }
    end,
  },

  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = { "BufEnter" },
    config = function()
      -- turn on lsp, formatting, and linting status and progress information
      require("fidget").setup {
        text = {
          spinner = "dots_negative",
        },
      }
    end,
  },
}
