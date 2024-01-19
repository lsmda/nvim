local options = {
  number = true,
  numberwidth = 4,
  relativenumber = true,

  hlsearch = false,
  incsearch = true,

  clipboard = "unnamedplus",
  scrolloff = 999,

  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
  autoindent = true,

  ignorecase = true,
  smartcase = true,

  splitbelow = true,
  splitright = true,

  hidden = true,
  showmode = false,
  signcolumn = "yes",

  backup = false,
  swapfile = false,

  fileencoding = "utf-8",
  wrap = false,

  cursorline = true,
  mouse = "",
  termguicolors = true,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
