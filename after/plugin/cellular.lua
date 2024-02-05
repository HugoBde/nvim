require("which-key").register({
    c = {
        name = "CellularAutomaton",
        g = { ":CellularAutomaton game_of_life<CR>", "Game of Life" },
        b = { ":CellularAutomaton make_it_rain<CR>", "Liquify" },
    },
}, { prefix = "<leader>" })
