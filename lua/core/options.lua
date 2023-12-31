local options = {
	number = true,
	numberwidth = 4,
	relativenumber = true,

	hlsearch = true,
	incsearch = true,

	clipboard = "unnamedplus",

	tabstop = 2,
	shiftwidth = 2,
	softtabstop = 2,
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
	termguicolors = true,
}

for option, value in pairs(options) do
	vim.opt[option] = value
end
