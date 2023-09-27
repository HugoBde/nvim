local trouble = require("trouble")

-- Open Diagnostic window / Trouble.nvim

require("which-key").register({
    o = {
        name = "Trouble",
        o = { trouble.toggle, "toggle diagnostic window" },
        i = { trouble.open, "open diagnostic window" },
        p = { trouble.close, "close diagnostic window" },
    },
}, { prefix = "<leader>" })
