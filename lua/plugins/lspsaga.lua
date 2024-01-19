return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
      },
      diagnostic = {
        show_code_action = true,
        max_height = 0.8,
        max_show_width = 0.7,
      },
    })
  end,
}
