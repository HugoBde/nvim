local apm = require("vim-apm")

apm:setup({})

require("which-key").register({
    a = { function() apm:toggle_monitor() end, "toggle vim-apm monitoring" }
}, { prefix = "<leader>" })
