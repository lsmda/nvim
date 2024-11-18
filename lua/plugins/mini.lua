return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.ai").setup()
    require("mini.pairs").setup()

    require("mini.comment").setup {
      options = {
        custom_commentstring = function()
          return vim.bo.commentstring
        end,
      },
    }

    -- commentstring for nix files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "nix",
      callback = function()
        vim.bo.commentstring = "# %s"
      end,
    })

    require("mini.statusline").setup()

    require("mini.indentscope").setup {
      draw = { delay = 50 },
    }

    require("mini.cursorword").setup {
      delay = 350,
    }

    require("mini.splitjoin").setup {
      mappings = {
        toggle = "<leader>j",
        split = "",
        join = "",
      },
    }

    local highlightColor = "#3F3F3F"
    vim.api.nvim_set_hl(0, "MiniCursorword", { bg = highlightColor })
    vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = highlightColor })
  end,
}
