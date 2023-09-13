local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Open Telescope" })
vim.keymap.set("n", "<leader>pF", builtin.git_files, { desc = "Open Telescope for Git Files" })
vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Telescope Live Grep" })
