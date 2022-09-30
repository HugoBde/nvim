vim.opt.number         = true
vim.opt.relativenumber = true
-- vim.opt.termguicolors  = true
vim.opt.wrap           = false
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.smarttab       = true
vim.opt.scrolloff      = 5
vim.opt.cursorline     = true

vim.opt.guifont = "Tamzen Nerd Font"

-- Load plugins
require("plugins")

-- Load personal configs
require("configs")
