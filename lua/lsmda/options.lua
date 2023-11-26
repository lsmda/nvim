local options = {
	autoindent = true,
	smartindent = true,
	tabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	showtabline = 0,

	number = true
}

for option, value in pairs(options) do vim.opt[option] = value end
