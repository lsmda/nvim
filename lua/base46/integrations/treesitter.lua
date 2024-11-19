return function(colors)
  return {
    ["@variable"] = { fg = colors.base05 },
    ["@variable.builtin"] = { fg = colors.base09 },
    ["@variable.parameter"] = { fg = colors.base08 },
    ["@variable.member"] = { fg = colors.base08 },
    ["@variable.member.key"] = { fg = colors.base08 },

    ["@module"] = { fg = colors.base08 },
    -- ["@module.builtin"] = { fg = colors.base08 },

    ["@constant"] = { fg = colors.base08 },
    ["@constant.builtin"] = { fg = colors.base09 },
    ["@constant.macro"] = { fg = colors.base08 },

    ["@string"] = { fg = colors.base0B },
    ["@string.regex"] = { fg = colors.base0C },
    ["@string.escape"] = { fg = colors.base0C },
    ["@character"] = { fg = colors.base08 },
    -- ["@character.special"] = { fg = colors.base08 },
    ["@number"] = { fg = colors.base09 },
    ["@number.float"] = { fg = colors.base09 },

    ["@annotation"] = { fg = colors.base0F },
    ["@attribute"] = { fg = colors.base0A },
    ["@error"] = { fg = colors.base08 },

    ["@keyword.exception"] = { fg = colors.base08 },
    ["@keyword"] = { fg = colors.base0E },
    ["@keyword.function"] = { fg = colors.base0E },
    ["@keyword.return"] = { fg = colors.base0E },
    ["@keyword.operator"] = { fg = colors.base0E },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.conditional"] = { fg = colors.base0E },
    ["@keyword.conditional.ternary"] = { fg = colors.base0E },
    ["@keyword.repeat"] = { fg = colors.base0A },
    ["@keyword.storage"] = { fg = colors.base0A },
    ["@keyword.directive.define"] = { fg = colors.base0E },
    ["@keyword.directive"] = { fg = colors.base0A },

    ["@function"] = { fg = colors.base0D },
    ["@function.builtin"] = { fg = colors.base0D },
    ["@function.macro"] = { fg = colors.base08 },
    ["@function.call"] = { fg = colors.base0D },
    ["@function.method"] = { fg = colors.base0D },
    ["@function.method.call"] = { fg = colors.base0D },
    ["@constructor"] = { fg = colors.base0C },

    ["@operator"] = { fg = colors.base05 },
    ["@reference"] = { fg = colors.base05 },
    ["@punctuation.bracket"] = { fg = colors.base0F },
    ["@punctuation.delimiter"] = { fg = colors.base0F },
    ["@symbol"] = { fg = colors.base0B },
    ["@tag"] = { fg = colors.base0A },
    ["@tag.attribute"] = { fg = colors.base08 },
    ["@tag.delimiter"] = { fg = colors.base0F },
    ["@text"] = { fg = colors.base05 },
    ["@text.emphasis"] = { fg = colors.base09 },
    ["@text.strike"] = { fg = colors.base0F, strikethrough = true },
    ["@type.builtin"] = { fg = colors.base0A },
    ["@definition"] = { sp = colors.base04, underline = true },
    ["@scope"] = { bold = true },
    ["@property"] = { fg = colors.base08 },

    -- markup
    ["@markup.heading"] = { fg = colors.base0D },
    ["@markup.raw"] = { fg = colors.base09 },
    ["@markup.link"] = { fg = colors.base08 },
    ["@markup.link.url"] = { fg = colors.base09, underline = true },
    ["@markup.link.label"] = { fg = colors.base0C },
    ["@markup.list"] = { fg = colors.base08 },
    ["@markup.strong"] = { bold = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.quote"] = { bg = colors.black2 },

    ["@comment"] = { fg = colors.grey_fg },
    ["@comment.todo"] = { fg = colors.grey, bg = colors.white },
    ["@comment.warning"] = { fg = colors.black2, bg = colors.base09 },
    ["@comment.note"] = { fg = colors.black, bg = colors.blue },
    ["@comment.danger"] = { fg = colors.black2, bg = colors.red },

    ["@diff.plus"] = { fg = colors.green },
    ["@diff.minus"] = { fg = colors.red },
    ["@diff.delta"] = { fg = colors.light_grey },
  }
end