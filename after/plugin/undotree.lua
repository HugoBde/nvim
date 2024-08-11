vim.g.undotree_ShortIndicators = 1
vim.g.undotree_SetFocusWhenToggle = 1

require("which-key").add({
    { "<leader>u", vim.cmd.UndotreeToggle, desc = "toggle undo tree" },
})
