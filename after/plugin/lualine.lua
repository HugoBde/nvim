require("lualine").setup({
    options = {
        section_separators = '',
        component_separators = '',
        theme = "codedark", -- todo: make it match colorscheme
    },
    sections = {
        lualine_a = {
            {
                'mode'
            }
        },
        lualine_b = {
            {
                'branch',
                icons_enabled = false
            },
            {
                'diff'
            }
        },
        lualine_c = {
            {
                'filename',
                newfile_status = true,
                path = 1
            },
        },

        lualine_x = {
            {
                'diagnostics',
                icons_enabled = false,
                sections = { "error", "warn" },
                update_in_insert = true,
                always_visible = true,
            },
            {
                'filetype'
            }
        },
        lualine_y = {
            {
                'datetime',
                style = "%H:%M:%S"
            }
        },
        lualine_z = {
            { 'location' }
        }
    },
})
