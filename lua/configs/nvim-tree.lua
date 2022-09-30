require("nvim-tree").setup({
    open_on_setup_file = true,
    hijack_cursor      = true,
    renderer = {
        special_files = {},
        indent_markers = {
            enable = true,
            inline_arrows = false,
        },
        icons = {
            webdev_colors = false,
            git_placement = "after"
        }
    },
    filters = {
        dotfiles = true
    }
})
