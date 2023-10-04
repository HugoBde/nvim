require("formatter").setup({
    filetype = {
        python = {
            require("formatter.filetypes.python").autopep8,
        }
    }
})


require("which-key").register({
    F = { ":Format<CR>", "format buffer" },
}, { prefix = "<leader>" })
