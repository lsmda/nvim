-- Initialize user preferences before plugins
require("options")
require("remap")

-- Plugins configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins", opts)

vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
vim.cmd[[hi EndOfBuffer guibg=NONE ctermbg=NONE]]

