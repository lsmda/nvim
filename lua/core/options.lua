local options = {
	number = true,
	relativenumber = true,
	numberwidth = 4,

	splitbelow = true,
	splitright = true,

	hlsearch = false,
	incsearch = true,

	wrap = false,
	fileencoding = "utf-8",

	clipboard = "unnamedplus",
	scrolloff = 999,

	expandtab = true,
	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,
	autoindent = true,

	ignorecase = true,
	smartcase = true,

	hidden = true,
	showmode = false,
	signcolumn = "yes",

	backup = false,
	swapfile = false,

	cursorline = true,
	mouse = "",
	termguicolors = true,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
