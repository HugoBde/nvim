vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "open NetRW" })
vim.keymap.set("n", "<leader>E", function()
    vim.cmd("vsplit")
    vim.cmd.Ex()
end
, { desc = "open NetRW" })

-- go to  beginning and end
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "go to beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "go to end of line" })

vim.keymap.set("n", "<ESC>", "<cmd> noh <CR>", { desc = "no highlight" })

-- switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "go to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "go to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "go to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "go to up window" })

-- Move lines in visual line selections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Concatenate the line below to the current line
vim.keymap.set("n", "J", "mzJ`z")

-- Keep search terms in middle of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep register content when visual pasting
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "paste and keep register content" })
vim.keymap.set({ "n", "x" }, "<leader>d", "\"_d", { desc = "delete and keep register content" })

-- Start replacing word
-- todo: add similar bindings for visual selection mode to only sub the selected string
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "replace word under cursor globally" })

vim.keymap.set("n", "<leader>S", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "replace word under cursor in line" })

vim.keymap.set("n", "<leader>y", "viwy", { desc = "yank word under cursor" })
vim.keymap.set("n", "<leader>c", "viwc", { desc = "replace word under cursor" })

vim.keymap.set("n", "<leader>=", "<cmd>wincmd =<cr>", { desc = "resize split" })

-- Todo: maybe add more complex logic to open man pages when filetype is c/cpp, or open vim help pages instead
vim.keymap.set("n", "<leader>m", ":vert Man <C-r><C-w><CR>", { desc = "open man page of word under cursor" })

-- Type a shell command
vim.keymap.set("n", "<leader>!", ":!", { desc = "shell command" })

--:nmap <F1> :echo<CR>
-- :imap <F1> <C-o>:echo<CR>
vim.keymap.set("n", "<F1>", ":echo<CR>")
vim.keymap.set("i", "<F1>", "<C-o>:echo<CR>")
