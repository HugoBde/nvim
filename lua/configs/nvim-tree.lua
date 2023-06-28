require("nvim-tree").setup({
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
