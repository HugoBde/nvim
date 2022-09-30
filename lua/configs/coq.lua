vim.g.coq_settings = {
    auto_start = true,
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

require("coq")
