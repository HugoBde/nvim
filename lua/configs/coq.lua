vim.g.coq_settings = {
    display = {
        ghost_text = {
            context = {" < ", " > "}
        },
        pum = {
            source_context = {" [", "] "}
        },
        preview = {
            border =  {
                            {"" , "NormalFloat"},
                            {"" , "NormalFloat"},
                            {"" , "NormalFloat"},
                            {" ", "NormalFloat"},
                            {"" , "NormalFloat"},
                            {"" , "NormalFloat"},
                            {"" , "NormalFloat"},
                            {" ", "NormalFloat"}
                        }
        },   
        icons = {
            mode = "none"
        }
    }
}

vim.cmd("COQnow -s")
