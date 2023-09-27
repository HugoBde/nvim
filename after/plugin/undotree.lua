vim.g.undotree_ShortIndicators = 1
vim.g.undotree_SetFocusWhenToggle = 1

require("which-key").register({
    u = { vim.cmd.UndotreeToggle, "toggle undo tree" },
}, { prefix = "<leader>" })
