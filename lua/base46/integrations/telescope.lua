local lighten = require("base46.colors").change_hex_lightness

return function(colors)
  return {
    TelescopeNormal = { bg = colors.darker_black },

    TelescopeSelection = {
      fg = colors.white,
      bg = lighten(colors.light_grey, -30),
      bold = true,
    },

    TelescopeBorder = {
      fg = colors.black2,
      bg = colors.darker_black,
    },

    TelescopePromptBorder = {
      fg = colors.black2,
      bg = colors.black2,
    },

    TelescopePromptNormal = {
      fg = colors.white,
      bg = colors.black2,
    },

    TelescopePromptPrefix = {
      fg = colors.red,
      bg = colors.black2,
    },

    TelescopePreviewTitle = {
      fg = colors.black,
      bg = colors.green,
    },

    TelescopePromptTitle = {
      fg = colors.black,
      bg = colors.red,
    },

    TelescopeResultsTitle = {
      fg = colors.darker_black,
      bg = colors.blue,
    },

    TelescopeResultsDiffAdd = { fg = colors.green },
    TelescopeResultsDiffChange = { fg = colors.yellow },
    TelescopeResultsDiffDelete = { fg = colors.red },

    TelescopeMatching = { bg = colors.one_bg, fg = colors.blue },
  }
end
