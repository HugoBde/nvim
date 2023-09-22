local builtin = require("telescope.builtin")

local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            n = {
                ["<C-Up>"]   = actions.preview_scrolling_up,
                ["<C-Down>"] = actions.preview_scrolling_down,
                ["<C-o>"]    = actions.file_vsplit
            },

            i = {
                ["<C-Up>"]   = actions.preview_scrolling_up,
                ["<C-Down>"] = actions.preview_scrolling_down,
                ["<C-o>"]    = actions.file_vsplit
            }
        }
    }
})

require("which-key").register({
    t = {
        name = "Telescope",
        f = { builtin.find_files, "search in files" },
        F = { builtin.git_files, "search in Git files" },
        s = { builtin.live_grep, "live grep search" },
        d = { builtin.grep_string, "grep search word under cursor" },
        a = { builtin.buffers, "search in open buffers" },
    },
}, { prefix = "<leader>" })
