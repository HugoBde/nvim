require("indent_blankline").setup({
    space_char_blankline = " ",
    show_current_context = true,
})
vim.cmd("highlight IndentBlanklineContextChar guifg=#a89984 gui=nocombine")
