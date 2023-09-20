require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "make",
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
