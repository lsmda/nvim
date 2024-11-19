local mix_col = require("base46.colors").mix

return function(colors)
  return {
    DiffviewDiffAdd = { bg = mix_col(colors.green, colors.black, 85) },
    DiffviewDiffText = { bg = mix_col(colors.green, colors.black, 70) },
    DiffviewDiffChange = { bg = mix_col(colors.green, colors.black, 85) },
    DiffviewDiffDelete = { bg = mix_col(colors.red, colors.black, 70) },
    DiffviewDiffDeleteDim = { bg = mix_col(colors.red, colors.black, 85) },
    DiffviewDiffAddAsDelete = { bg = mix_col(colors.red, colors.black, 85) },
  }
end
