require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "go",
        "gomod",
        "gosum",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "ocaml",
        "python",
        "regex",
        "rust",
        "sxhkdrc",
        "toml",
        "typescript",
        "tsx",
        "vim",
        "zig"
    },

    sync_install = false,

    auto_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    autotag = {
        enable = true,
    }
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.obey = {
    install_info = {
        url = "~/Documents/Programming/treeshitter/tree-sitter-obey",
        files = { "src/parser.c" },             -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "main",                        -- default branch in case of git repo if different from master
        requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    },
    filetype = "obey",                          -- if filetype does not match the parser name
}
