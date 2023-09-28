require("formatter").setup({
    filetype = {
        python = {
            require("formatter.filetypes.python").autopep8,
        }
    }
})


require("which-key").register({
    f = { ":Format<CR>", "format buffer" },
    F = { ":FormatWrite<CR>", "format buffer and save" },
}, { prefix = "<leader>" })
