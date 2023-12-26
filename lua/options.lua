local options = {
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	clipboard = "unnamedplus",

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
	undodir = os.getenv("HOME") .. "/.vim/undodir",
}

for option, value in pairs(options) do
	vim.opt[option] = value
end
