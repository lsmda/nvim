return {
  "saghen/blink.cmp",
  lazy = true,
  dependencies = {
    "rafamadriz/friendly-snippets",
    "echasnovski/mini.icons",
  },
  version = "*",
  opts = {
    completion = {
      menu = {
        border = "single",
        draw = {
          columns = {
            { "label", "label_description", gap = 2 },
            { "kind_icon", "kind", gap = 1 },
          },
        },
      },
      documentation = {
        auto_show = true,
        window = {
          border = "single",
        },
      },
    },
    keymap = {
      preset = "enter",
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "snippets", "buffer", "path" },
      cmdline = {},
    },
  },
  opts_extend = { "sources.default" },
}
