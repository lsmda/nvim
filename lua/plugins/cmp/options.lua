---@diagnostic disable: undefined-field
local cmp_ui = require("nvimrc").ui.cmp
local cmp_style = cmp_ui.style
local format_kk = require "plugins.cmp.format"

local atom_styled = cmp_style == "atom" or cmp_style == "atom_colored"
local fields = (atom_styled or cmp_ui.icons_left) and { "kind", "abbr", "menu" } or { "abbr", "kind", "menu" }

local cmp = require "cmp"
local luasnip = require "luasnip"

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local M = {
  formatting = {
    format = function(entry, item)
      local icons = require "icons.lspkind"

      item.abbr = item.abbr .. " "
      item.menu = cmp_ui.lspkind_text and item.kind or ""
      item.menu_hl_group = atom_styled and "LineNr" or "CmpItemKind" .. (item.kind or "")
      item.kind = (icons[item.kind] or "") .. " "

      if not cmp_ui.icons_left then
        item.kind = " " .. item.kind
      end

      if cmp_ui.format_colors.tailwind then
        format_kk.tailwind(entry, item)
      end

      return item
    end,

    fields = fields,
  },

  window = {
    completion = {
      scrollbar = false,
      side_padding = atom_styled and 0 or 1,
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None,FloatBorder:CmpBorder",
      border = atom_styled and "none" or "single",
    },
    documentation = {
      border = "single",
      winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
    },
  },

  mappings = {
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
}

return M
