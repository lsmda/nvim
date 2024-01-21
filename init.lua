require("core.autocmd")
require("core.utils").load_mappings()
require("core.options")

-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ import = "plugins" },
	{ import = "plugins.lsp" },
}

local opts = {
	change_detection = {
		enabled = true,
		notify = false,
	},
}

require("lazy").setup(plugins, opts)
