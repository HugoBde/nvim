require("formatter").setup({
    filetype = {
        python = {
            require("formatter.filetypes.python").autopep8,
        },
        ocaml = {
            require("formatter.filetypes.ocaml").ocamlformat
        }
    }
})


require("which-key").register({
    F = { ":Format<CR>", "format buffer" },
}, { prefix = "<leader>" })
