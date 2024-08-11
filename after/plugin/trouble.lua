local trouble = require("trouble")

require("which-key").register({
    o = {
        name = "Trouble",
        o = { function() trouble.toggle("diagnostics") end, "open diagnostic window" },
        r = { function() trouble.toggle("lsp_references") end, "open lsp references" },
        p = { trouble.close, "close trouble window" },
    },
}, { prefix = "<leader>" })
