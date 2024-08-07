local trouble = require("trouble")

require("which-key").add({
    { "<leader>o",  group = "Trouble" },
    { "<leader>oi", trouble.open,     desc = "open diagnostic window" },
    { "<leader>oo", trouble.toggle,   desc = "toggle diagnostic window" },
    { "<leader>op", trouble.close,    desc = "close diagnostic window" } })
