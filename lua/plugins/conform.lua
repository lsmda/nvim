-- formatter
return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>w",
      function()
        require("conform").format { async = true, lsp_fallback = true }
        vim.cmd "w"
      end,
      desc = "Format and write current buffer",
    },
  },
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
}
