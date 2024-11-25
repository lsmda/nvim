---@diagnostic disable: undefined-field
local utils = require "config.utils"

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup "highlight_yank",
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- auto-save file on change
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
  group = augroup "auto_save",
  pattern = "*",
  callback = function()
    if vim.fn.pumvisible() == 0 then
      vim.defer_fn(utils.save_file, 10)
    end
  end,
})

-- commentstring for nix files
vim.api.nvim_create_autocmd("FileType", {
  group = augroup "nix_comment",
  pattern = "nix",
  callback = function()
    vim.bo.commentstring = "# %s"
    return vim.bo.commentstring
  end,
})

-- auto-create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup "auto_create_dir",
  callback = function(event)
    if event.match:match "^%w%w+:[\\/][\\/]" then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})
