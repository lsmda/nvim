return function(colors)
  return {
    Added = { fg = colors.green },
    Removed = { fg = colors.red },
    Changed = { fg = colors.yellow },
    MatchWord = { bg = colors.grey, fg = colors.white },
    Pmenu = { bg = colors.one_bg },
    PmenuSbar = { bg = colors.one_bg },
    PmenuSel = { bg = colors.pmenu_bg, fg = colors.black },
    PmenuThumb = { bg = colors.light_grey },
    MatchParen = { link = "MatchWord" },
    Comment = { fg = colors.light_grey },
    CursorLineNr = { fg = colors.white },
    LineNr = { fg = colors.grey },
    FloatBorder = { fg = colors.blue },
    FloatTitle = { fg = colors.white, bg = colors.grey },
    NormalFloat = { bg = colors.darker_black },
    NvimInternalError = { fg = colors.red },
    WinSeparator = { fg = colors.line },
    Normal = { fg = colors.base05 },
    DevIconDefault = { fg = colors.red },
    Debug = { fg = colors.base08 },
    Directory = { fg = colors.base0D },
    Error = { fg = colors.base00, bg = colors.base08 },
    ErrorMsg = { fg = colors.base08, bg = colors.base00 },
    Exception = { fg = colors.base08 },
    FoldColumn = { bg = "none" },
    Folded = { fg = colors.light_grey, bg = colors.black2 },
    IncSearch = { fg = colors.base01, bg = colors.base09 },
    Macro = { fg = colors.base08 },
    ModeMsg = { fg = colors.base0B },
    MoreMsg = { fg = colors.base0B },
    Question = { fg = colors.base0D },
    Search = { fg = colors.base01, bg = colors.base0A },
    Substitute = { fg = colors.base01, bg = colors.base0A },
    SpecialKey = { fg = colors.base03 },
    TooLong = { fg = colors.base08 },
    Visual = { bg = colors.base02 },
    VisualNOS = { fg = colors.base08 },
    WarningMsg = { fg = colors.base08 },
    WildMenu = { fg = colors.base08, bg = colors.base0A },
    Title = { fg = colors.base0D },
    Conceal = { bg = "NONE" },
    Cursor = { fg = colors.base00, bg = colors.base05 },
    NonText = { fg = colors.light_grey }, -- git blame string
    SignColumn = { fg = colors.base03 },
    ColorColumn = { bg = colors.black2 },
    CursorColumn = { bg = colors.base01 },
    CursorLine = { bg = colors.black2 },
    QuickFixLine = { bg = colors.base01 },
    healthSuccess = { bg = colors.green, fg = colors.black },
    WinBar = { bg = "NONE" },
    WinBarNC = { bg = "NONE" },

    Bold = { bold = true },
    Italic = { italic = true },
    UnderLined = { fg = colors.base0B },

    TabLine = {
      bg = colors.darker_black,
      fg = colors.light_grey,
    },

    TabLineFill = {
      bg = colors.darker_black,
      fg = colors.light_grey,
    },

    TabLineSel = {
      bg = colors.black2,
      fg = colors.white,
    },

    StatusLine = {
      bg = "none",
      sp = "none",
    },

    StatusLineNC = {
      fg = colors.black2,
    },

    -- spelling
    SpellBad = {
      undercurl = true,
      sp = colors.base08,
    },

    SpellLocal = {
      undercurl = true,
      sp = colors.base0C,
    },

    SpellCap = {
      undercurl = true,
      sp = colors.base0D,
    },

    SpellRare = {
      undercurl = true,
      sp = colors.base0E,
    },
  }
end
