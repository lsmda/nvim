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
    "windwp/nvim-autopairs",
    { "hrsh7th/cmp-cmdline" },
    -- adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. they are split
    --  into multiple repos for maintenance purposes.
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    local lspkind = require "lspkind"
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"

    require("nvim-autopairs").setup {
      check_ts = true,
    }

    -- integrate nvim-autopairs with cmp
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- load snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    luasnip.config.setup()

    local check_backspace = function()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      window = {
        completion = cmp.config.window.bordered {
          border = "single", -- can be "single", "double", "rounded", "solid", "shadow"
          winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
          scrollbar = true,
          col_offset = 0,
          side_padding = 1,
        },
        documentation = cmp.config.window.bordered {
          border = "single", -- can be "single", "double", "rounded", "solid", "shadow"
          winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
          scrollbar = true,
          col_offset = 0,
          side_padding = 1,
        },
      },
      mapping = cmp.mapping.preset.insert {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      -- sources for autocompletion
      sources = cmp.config.sources {
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip", max_item_count = 3 }, -- snippets
        { name = "path", max_item_count = 3 }, -- file system paths
        { name = "buffer", max_item_count = 3 }, -- text within current buffer
      },
      formatting = {
        fields = {
          "abbr",
          "kind",
          "menu",
        },
        expandable_indicator = true,
        format = lspkind.cmp_format {
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
        },
      },
      experimental = {
        ghost_text = false,
      },
    }

    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources {
        { name = "git" },
        { name = "buffer" },
      },
    })

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
