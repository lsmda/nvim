return {
  "jayden-chan/base46.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local base46 = require "base46"

    base46.load_theme {
      base = "base46",
      theme = "aquarium",
      transparency = true,
    }
  end,
}
