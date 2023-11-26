local options = {
	autoindent = true,
	smartindent = true,
	tabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	showtabline = 0,

	number = true,
  numberwidth = 4,
  incsearch = true,
  hlsearch = true,
  ignorecase = true,
  smartcase = true,

  splitbelow = true,
  splitright = true,

  termguicolors = true,
  hidden = true,
  signcolumn = "no",
  showmode = false,
  wrap = false,
  cursorline = true,
  fileencoding = "utf-8",

  backup = false,
  title = true,
}

for option, value in pairs(options) do vim.opt[option] = value end

