require("which-key").add({
    { "<leader>c",  group = "CellularAutomaton" },
    { "<leader>cg", ":CellularAutomaton game_of_life<CR>", desc = "Game of Life" },
    { "<leader>cl", ":CellularAutomaton make_it_rain<CR>", desc = "Liquify" },
})
