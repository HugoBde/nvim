vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.termguicolors  = true
-- always make real tabs 8 spaces so they are easy to spot
-- soft tabs are set on a file type basis further below
vim.opt.tabstop        = 8
vim.opt.expandtab      = true
vim.opt.smarttab       = true
vim.opt.scrolloff      = 8
vim.opt.sidescrolloff  = 8
vim.opt.cursorline     = true
vim.opt.clipboard      = "unnamedplus"
vim.opt.hlsearch       = false
vim.opt.incsearch      = true
vim.opt.colorcolumn    = "120"
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.splitright     = true
vim.opt.updatetime     = 750
vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.undodir        = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile       = true

vim.diagnostic.config({
    signs = false,
    severity_sort = true,
})

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

-- Set tab size on a file type basic
vim.api.nvim_create_autocmd({ "FileType" }, {
    callback = function(event)
        local config_tab_size = {
            javascriptreact = 2,
            typescriptreact = 2,
            javascript = 2,
            typescript = 2,
            html = 2,
            go = 8
        }
        local default_tab_size = 4
        local tab_size = config_tab_size[event.match] or default_tab_size

        vim.o.shiftwidth = tab_size
        vim.o.softtabstop = tab_size
    end
})
