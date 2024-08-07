local builtin = require("telescope.builtin")

local actions = require("telescope.actions")

local telescope = require("telescope")

telescope.setup({
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

telescope.load_extension("fzf")

require("which-key").add({
    { "<leader>t",   group = "Telescope" },
    { "<leader>tf",  builtin.find_files,            desc = "search in files" },
    { "<leader>tF",  builtin.git_files,             desc = "search in Git files" },
    { "<leader>tg",  builtin.live_grep,             desc = "live grep search" },
    { "<leader>td",  builtin.grep_string,           desc = "grep search word under cursor" },
    { "<leader>ta",  builtin.buffers,               desc = "search in open buffers" },
    { "<leader>ts",  builtin.lsp_document_symbols,  desc = "search in document symbols" },
    { "<leader>tS",  builtin.lsp_workspace_symbols, desc = "search in workspace symbols" },
    { "<leader>tr",  builtin.resume,                desc = "resume last search" },
    { "<leader>tp",  builtin.builtin,               desc = "pick a builtin picker" } })
