local icons = require("config.utils").icons

return {
  -- colorscheme should have highest priority
  {
    dir = "~/.config/nvim/lua/base46",
    lazy = false,
    priority = 1000,
    config = function()
      local base46 = require "base46"

      base46.load_theme {
        base = "base46",
        theme = "aquarium",
        transparency = true,
      }
    end,
  },

  -- required on load
  {
    "christoomey/vim-tmux-navigator",
  },

  {
    "vigoux/notifier.nvim",
    opts = {},
  },

  {
    "stevearc/dressing.nvim",
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
    "windwp/nvim-ts-autotag", -- auto add closing tags for html and jsx
    lazy = true,
    opts = {},
  },

  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
  },

  -- lazy
  {
    "mg979/vim-visual-multi",
    lazy = true,
  },

  {
    "ggandor/leap.nvim",
    lazy = true,
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
    opts = {
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
    },
  },

  {
    "folke/which-key.nvim",
    lazy = true,
    opts = {
      window = {
        border = "single",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 1, 1, 1, 1 },
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "BufEnter",
    opts = {
      signs = {
        add = {
          hl = "GitSignsAdd",
          text = icons.ui.BoldLineLeft,
          numhl = "GitSignsAddNr",
          linehl = "GitSignsAddLn",
        },
        change = {
          hl = "GitSignsChange",
          text = icons.ui.BoldLineLeft,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
        delete = {
          hl = "GitSignsDelete",
          text = icons.ui.TriangleShortArrowRight,
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        topdelete = {
          hl = "GitSignsDelete",
          text = icons.ui.TriangleShortArrowRight,
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          hl = "GitSignsChange",
          text = icons.ui.BoldLineLeft,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = "<author>, <author_time:%d-%m-%Y> <summary>",
      update_debounce = 150,
      max_file_length = 40000,
      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = ":TSUpdate",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    opts = {
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
      },
    },
  },

  { -- formatter
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        css = { "prettierd" },
        graphql = { "prettierd" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        nix = { "nixfmt" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        yaml = { "prettierd" },
        go = { "crlfmt" },
        gomod = { "crlfmt" },
        python = { "ruff" },
      },
    },
  },
}
