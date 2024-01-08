require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "c_sharp",
        "css",
        "diff",
        "dockerfile",
        "go",
        "gomod",
        "gosum",
        "html",
        "javascript",
        "json",
        "llvm",
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

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
