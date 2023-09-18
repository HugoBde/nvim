vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.termguicolors  = true
vim.opt.tabstop        = 8
vim.opt.softtabstop    = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true
vim.opt.smarttab       = true
vim.opt.scrolloff      = 8
vim.opt.cursorline     = true
vim.opt.clipboard      = "unnamedplus"
vim.g.mapleader        = " "
vim.opt.hlsearch       = false
vim.opt.incsearch      = true
vim.opt.colorcolumn    = "120"
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.splitright     = true
vim.cmd("colorscheme kanagawa")

-- Set Wrap on a file type basis
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function(event)
        local file_name = event.file

        local file_extension = file_name:match("^.+(%..+)$")

        if file_extension == ".md" or file_extension == ".txt" then
            vim.opt.wrap = true
        else
            vim.opt.wrap = false
        end
    end
})
