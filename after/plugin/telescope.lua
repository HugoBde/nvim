local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Open Telescope" })
vim.keymap.set("n", "<leader>pF", builtin.git_files, { desc = "Open Telescope for Git Files" })
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Grep search" })
