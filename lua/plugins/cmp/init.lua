---@diagnostic disable: undefined-field
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter" },
  dependencies = {
    -- snippet engine & its associated nvim-cmp source
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        -- build step is needed for regex support in snippets.
        -- this step is not supported in many windows environments.
        -- remove the below condition to re-enable on windows.
        if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    see the readme about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
      },
    },
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-cmdline",
    -- adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. they are split
    --  into multiple repos for maintenance purposes.
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    luasnip.config.setup()

    -- load vscode snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    local cmp_formatting = require("plugins.cmp.options").formatting
    local cmp_mappings = require("plugins.cmp.options").mappings
    local cmp_window = require("plugins.cmp.options").window

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      formatting = cmp_formatting,
      window = cmp_window,
      mapping = cmp_mappings,
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      -- sources for autocompletion
      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      },
      experimental = {
        ghost_text = false,
      },
    }

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources {
        { name = "path" },
        { name = "cmdline" },
      },
    })
  end,
}
