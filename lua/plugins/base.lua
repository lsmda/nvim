return {
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  {
    "mg979/vim-visual-multi",
  },

  {
    "vigoux/notifier.nvim",
    config = function()
      require("notifier").setup {}
    end,
  },

  {
    "ggandor/leap.nvim",
    config = function()
      vim.keymap.set({ "n" }, "s", "<Plug>(leap-forward-to)")
      vim.keymap.set({ "n" }, "S", "<Plug>(leap-backward-to)")
    end,
  },

  {
    "axelvc/template-string.nvim",
    config = function()
      require("template-string").setup {}
    end,
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
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    init = function()
      vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
      { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
      require("lspsaga").setup {
        ui = {
          border = "rounded",
        },
        diagnostic = {
          show_code_action = true,
          max_height = 0.8,
          max_show_width = 0.7,
        },
      }
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("todo-comments").setup()
      vim.keymap.set("n", "<leader>ft", "<CMD>TodoTelescope<CR>", { desc = "Find todos" })
    end,
  },

  {
    "rmagatti/alternate-toggler",
    event = { "BufReadPost" },
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

      vim.keymap.set(
        "n",
        "<leader>tt",
        "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>",
        { desc = "Toggle value", silent = true }
      )
    end,
  },

  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = { "BufEnter" },
    config = function()
      -- Turn on LSP, formatting, and linting status and progress information
      require("fidget").setup {
        text = {
          spinner = "dots_negative",
        },
      }
    end,
  },
}
