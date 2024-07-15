" Reset
" -------------------------------------------------------
hi clear
syntax reset
let g:colors_name = "bubblegum"
set background=dark
set t_Co=256

" Palette
" -------------------------------------------------------
let s:gray0 = "#262626"
let s:gray1 = "#45484d"
let s:gray2 = "#737880"
let s:gray3 = "#959ba6"
let s:gray4 = "#aeb5c2"
let s:gray5 = "#bec5d4"

let s:red = "#f9c2e0"
let s:green = "#a7f3d0"
let s:blue = "#b7d6fe"
let s:yellow = "#f0bfa8"
let s:magenta = "#dbd5fe"
let s:white = "#fef6f6"

let s:bg = s:gray0
let s:fg = s:white

" Highlight groups
" -------------------------------------------------------
execute 'hi Normal guifg=' . s:fg . ' ctermbg=NONE guibg=' . s:bg . ' gui=NONE'
execute 'hi Comment guifg=' . s:gray2 . ' gui=italic'
execute 'hi Constant guifg=' . s:white . ' guibg=NONE'
execute 'hi String guifg=' . s:gray5 . ' guibg=NONE'
execute 'hi Number guifg=' . s:red . ' guibg=NONE'
execute 'hi Boolean guifg=' . s:red . ' guibg=NONE'
execute 'hi Identifier guifg=' . s:magenta . ' guibg=NONE'
execute 'hi Function guifg=' . s:magenta . ' guibg=NONE'

execute 'hi Statement guifg=' . s:blue . ' guibg=NONE'
execute 'hi Conditional guifg=' . s:blue . ' guibg=NONE'
execute 'hi Repeat guifg=' . s:red . ' guibg=NONE'
execute 'hi Label guifg=' . s:blue . ' guibg=NONE'
execute 'hi Operator guifg=' . s:white . ' guibg=NONE'
execute 'hi Keyword guifg=' . s:red . ' guibg=NONE'
execute 'hi Exception guifg=' . s:white . ' guibg=NONE'

execute 'hi PreProc guifg=' . s:fg . ' guibg=NONE'
execute 'hi Include guifg=' . s:fg . ' guibg=NONE'
execute 'hi Define guifg=' . s:blue . ' guibg=NONE'
execute 'hi Macro guifg=' . s:blue . ' guibg=NONE'
execute 'hi PreCondit guifg=' . s:blue . ' guibg=NONE'
execute 'hi Type guifg=' . s:fg . ' guibg=NONE'
execute 'hi Storage guifg=' . s:fg . ' guibg=NONE'
execute 'hi StorageClass guifg=' . s:fg . ' guibg=NONE'
execute 'hi Structure guifg=' . s:fg . ' guibg=NONE'
execute 'hi Typedef guifg=' . s:fg . ' guibg=NONE'
execute 'hi Special guifg=' . s:fg . ' guibg=NONE' 
execute 'hi SpecialChar guifg=' . s:red . ' guibg=NONE'
execute 'hi Tag guifg=' . s:fg . ' guibg=NONE'
execute 'hi SpecialComment guifg=' . s:gray3 . ' gui=italic guibg=NONE'
execute 'hi Debug guifg=' . s:blue . ' guibg=NONE'
execute 'hi Underlined guifg=' . s:blue . ' guibg=NONE'
execute 'hi Ignore guifg=' . s:blue . ' guibg=NONE'
execute 'hi Error guifg=' . s:fg . ' guibg=NONE'
execute 'hi Todo guifg=' . s:blue . ' guibg=NONE'
execute 'hi MatchParen guifg=' . s:fg . ' guibg=s:gray5'
execute 'hi Delimiter guifg=' . s:fg . ' guibg=NONE' 
execute 'hi FloatBorder guifg=' . s:bg . ' guibg=NONE'
execute 'hi IncSearch guifg=' . s:gray3 . ' guibg=NONE'
execute 'hi Search guibg=' . s:gray3 . ' guifg=' . s:fg

execute 'hi DiffAdd guifg=' . s:green . ' guibg=NONE'
execute 'hi GitGutterAdd guifg=' . s:green . ' guibg=NONE'
execute 'hi DiffText guifg=' . s:white . ' guibg=NONE'
execute 'hi DiffChange guifg=' . s:blue . ' guibg=NONE'
execute 'hi GitGutterChange guifg=' . s:blue . ' guibg=NONE'
execute 'hi DiffDelete guifg=' . s:red . ' guibg=NONE'
execute 'hi GitGutterDelete guifg=' . s:red . ' guibg=NONE'
execute 'hi GitGutterChangeDelete guifg=' . s:red . ' guibg=NONE'
execute 'hi SignColumn guibg=' . s:bg

execute 'hi Title guifg=' . s:white
execute 'hi LineNr guifg=' . s:gray2 . ' guibg=' . s:bg
execute 'hi NonText guifg=' . s:gray3 . ' guibg=' . s:bg
execute 'hi CursorLine guibg=' . s:bg
execute 'hi TabLineFill gui=NONE guibg=' . s:gray3
execute 'hi TabLine guifg=' . s:gray3 . ' guibg=' . s:bg . ' gui=NONE'
execute 'hi StatusLine gui=bold guibg=' . s:bg . ' guifg=' . s:fg
execute 'hi StatusLineNC gui=NONE guibg=' . s:bg . ' guifg=' . s:fg
execute 'hi StatusLineTerm gui=NONE guibg=' . s:bg . ' guifg=' . s:fg
execute 'hi StatusLineTermNC gui=NONE guibg=' . s:bg . ' guifg=' . s:fg
execute 'hi PMenu gui=NONE guibg=' . s:bg . ' guifg=' . s:fg
execute 'hi Visual gui=NONE guibg=' . s:gray1
