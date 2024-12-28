return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    opts = {
      provider = "openai",
      openai = {
        endpoint = "https://api.deepseek.com/v1",
        api_key_name = "OPENAI_API_KEY",
        model = "deepseek-chat",
        timeout = 30000, -- timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
      },
      behaviour = {
        support_paste_from_clipboard = true,
      },
      windows = {
        width = 50,
        ask = {
          start_insert = false,
        },
        sidebar_header = {
          enabled = false,
        },
        input = {
          prefix = "$ ",
          height = 10,
        },
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for windows users
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
