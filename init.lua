-- basic settings and options
require("options")

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "git@github.com:folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = { ui = { border = "rounded" }, git = { url_format = "git@github.com:%s.git"} }

require("lazy").setup("plugins", lazy_opts)

-- keymappings
require("keymappings")

vim.api.nvim_exec(
  [[
    augroup ft_terminal
      autocmd!
      autocmd TermOpen * setlocal nonumber norelativenumber
    augroup END
  ]],
  false
)
