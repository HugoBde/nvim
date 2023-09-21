local trouble = require("trouble")

-- Open Diagnostic window / Trouble.nvim
vim.keymap.set("n", "<leader>xx", trouble.toggle, { desc = "toggle diagnostic window" })
vim.keymap.set("n", "<leader>xz", trouble.open, { desc = "open diagnostic window" })
vim.keymap.set("n", "<leader>xc", trouble.close, { desc = "close diagnostic window" })
