require("nvim-tree").setup({
    open_on_setup_file = true,
    hijack_cursor      = true,
    renderer = {
        special_files = {},
        indent_markers = {
            enable = true,
            icons = {
               item = "├" 
            }
        },
        icons = {
            webdev_colors = false,
            git_placement = "after",
            show = {
                folder_arrow = false
            }
        }
    },
    filters = {
        dotfiles = true
    }
})
