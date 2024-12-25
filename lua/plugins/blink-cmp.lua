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
      menu = { border = "single" },
      documentation = {
        window = { border = "single" },
      },
    },
    signature = {
      window = { border = "single" },
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
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
  opts_extend = { "sources.default" },
}
