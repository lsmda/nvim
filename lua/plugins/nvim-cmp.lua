---@diagnostic disable: undefined-field
local api = vim.api

local M = {}
local fields = { "abbr", "kind", "menu" }

-- show tailwind color icon on completion menu
M.tailwind = function(entry, item)
  local entryItem = entry:get_completion_item()
  local color = entryItem.documentation

  if color and type(color) == "string" and color:match "^#%x%x%x%x%x%x$" then
    local hl = "hex-" .. color:sub(2)

    if #api.nvim_get_hl(0, { name = hl }) == 0 then
      api.nvim_set_hl(0, hl, { fg = color })
    end

    item.kind = " " .. "󱓻" .. " "
    item.kind_hl_group = hl
    item.menu_hl_group = hl
  end
end

M.check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

return {
  "hrsh7th/nvim-cmp",
  lazy = true,
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
    "windwp/nvim-autopairs",
    -- adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. they are split
    --  into multiple repos for maintenance purposes.
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"

    luasnip.config.setup()

    -- load vscode snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- enable nvim-autopairs with cmp
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- enable typescript integration
    require("nvim-autopairs").setup { check_ts = true }

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      formatting = {
        format = function(entry, item)
          local icons = require("config.utils").icons.lspkind

          item.abbr = item.abbr .. " "
          item.menu = item.kind or ""
          item.menu_hl_group = "CmpItemKind" .. (item.kind or "")
          item.kind = (icons[item.kind] or "") .. " "
          item.kind = " " .. item.kind

          M.tailwind(entry, item)

          return item
        end,
        fields = fields,
      },
      window = {
        completion = {
          scrollbar = false,
          side_padding = 1,
          winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None,FloatBorder:CmpBorder",
          border = "single",
        },
        documentation = {
          border = "single",
          winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
        },
      },
      mapping = {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif M.check_backspace() then
            fallback()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
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
