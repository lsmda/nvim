-- linter
return {
  "mfussenegger/nvim-lint",
  lazy = true,
  opts = {
    linters = {
      eslint_d = {
        args = {
          "--no-warn-ignored", -- <- this is the key argument
          "--format",
          "json",
          "--stdin",
          "--stdin-filename",
          function()
            return vim.api.nvim_buf_get_name(0)
          end,
        },
      },
    },
  },
  config = function()
    require("lint").linters_by_ft = {
      css = { "eslint_d" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
