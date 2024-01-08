require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "bash",
        "c",
        "javascript",
        "json",
        "lua",
        "make",
<<<<<<< HEAD
=======
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
>>>>>>> master
    },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
