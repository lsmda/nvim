local generate_color = require("base46.colors").change_hex_lightness

return function(colors)
  local statusline_bg = "NONE"
  local light_grey = generate_color(colors.light_grey, 8)

  local M = {
    StatusLine = { bg = statusline_bg },
    St_gitIcons = { fg = light_grey, bg = statusline_bg, bold = true },
    St_Lsp = { fg = colors.nord_blue, bg = statusline_bg },
    St_LspMsg = { fg = colors.green, bg = statusline_bg },
    St_EmptySpace = { fg = colors.grey, bg = colors.lightbg },
    St_file = { bg = colors.lightbg, fg = colors.white },
    St_file_sep = { bg = statusline_bg, fg = colors.lightbg },
    St_cwd_icon = { fg = colors.one_bg, bg = colors.red },
    St_cwd_text = { fg = colors.white, bg = colors.lightbg },
    St_cwd_sep = { fg = colors.red, bg = statusline_bg },
    St_pos_sep = { fg = colors.green, bg = colors.lightbg },
    St_pos_icon = { fg = colors.black, bg = colors.green },
    St_pos_text = { fg = colors.green, bg = colors.lightbg },

    -- lsp highlights
    St_lspError = { fg = colors.red, bg = statusline_bg },
    St_lspWarning = { fg = colors.yellow, bg = statusline_bg },
    St_LspHints = { fg = colors.purple, bg = statusline_bg },
    St_LspInfo = { fg = colors.green, bg = statusline_bg },

    -- mini statusline
    MiniStatuslineModeNormal = { fg = colors.black, bg = colors.nord_blue },
    MiniStatuslineModeInsert = { fg = colors.black, bg = colors.green },
    MiniStatuslineModeVisual = { fg = colors.black, bg = colors.purple },
    MiniStatuslineModeReplace = { fg = colors.black, bg = colors.red },
    MiniStatuslineModeCommand = { fg = colors.black, bg = colors.yellow },
    MiniStatuslineModeOther = { fg = colors.white, bg = colors.grey },
    MiniStatuslineDevinfo = { fg = colors.white, bg = colors.one_bg2 },
    MiniStatuslineFilename = { fg = colors.white, bg = statusline_bg },
    MiniStatuslineFileinfo = { fg = colors.white, bg = statusline_bg },
    MiniStatuslineInactive = { fg = colors.grey_fg, bg = statusline_bg },
  }

  local function genModes_hl(modename, col)
    M["St_" .. modename .. "Mode"] = { fg = colors.black, bg = colors[col], bold = true }
    M["St_" .. modename .. "ModeSep"] = { fg = colors[col], bg = colors.grey }
  end

  genModes_hl("Normal", "nord_blue")
  genModes_hl("Visual", "cyan")
  genModes_hl("Insert", "dark_purple")
  genModes_hl("Terminal", "green")
  genModes_hl("NTerminal", "yellow")
  genModes_hl("Replace", "orange")
  genModes_hl("Confirm", "teal")
  genModes_hl("Command", "green")
  genModes_hl("Select", "blue")

  return M
end
