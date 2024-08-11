local trouble = require("trouble")

require("which-key").add({
    { "<leader>o",  group = "Trouble" },
    { "<leader>oi", "<cmd>Trouble diagnostics open<cr>",   desc = "open diagnostic window" },
    { "<leader>oo", "<cmd>Trouble diagnostics toggle<cr>", desc = "toggle diagnostic window" },
    { "<leader>op", "<cmd>Trouble diagnostics close<cr>",  desc = "close diagnostic window" } })
