local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "telescope search in files" })
vim.keymap.set("n", "<leader>tF", builtin.git_files, { desc = "telescope search in Git Files" })
vim.keymap.set("n", "<leader>ts", builtin.live_grep, { desc = "telescope Live Grep" })
vim.keymap.set("n", "<leader>td", builtin.grep_string, { desc = "telescope Grep search selection" })
vim.keymap.set("n", "<leader>ta", builtin.buffers, { desc = "telescope search in open buffers" })

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
