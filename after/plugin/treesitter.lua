require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "c",
        "cpp",
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
        "rust",
        "zig"
    },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
