vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open NetRW" })

-- go to  beginning and end
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Go to beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "Go to end of line" })

vim.keymap.set("n", "<ESC>", "<cmd> noh <CR>", { desc = "no highlight" })

-- switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to up window" })

-- Move lines in visual line selections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep search terms in middle of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep register content when visual pasting
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste and keep register content" })
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Delete" })
vim.keymap.set("x", "<leader>d", "\"_d", { desc = "Delete" })

-- Open Diagnostic window / Trouble.nvim
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle diagnostic window" })
vim.keymap.set("n", "<leader>xz", function() require("trouble").open() end, { desc = "Open diagnostic window" })
vim.keymap.set("n", "<leader>xc", function() require("trouble").close() end, { desc = "Close diagnostic window" })

-- Start replacing word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
