vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- go to  beginning and end
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "end of line" })

vim.keymap.set("n", "<ESC>", "<cmd> noh <CR>", { desc = "no highlight" })

-- switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "window up" })

-- Move lines in visual line selections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep search terms in middle of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep register content when visual pasting
vim.keymap.set("x", "<leader>p", "\"_dP")
