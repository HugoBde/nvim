local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        go = { "gofmt" },
        markdown = { "mdformat" },
        ocaml = { "ocamlformat" },
        python = { "black" },
        rust = { "rustfmt" },
        toml = { "taplo" },
        templ = { "templ" },
        yaml = { "yamlfmt" },
        zig = { "zigfmt" },
    },

    formatters = {
        -- ocamlformat = {
        --     prepend_args = { "--enable-outside-detected-project" }
        -- }
    },

    format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end
        return {
            timeout_ms = 500,
            lsp_fallback = true,
            quiet = true
        }
    end,
})

vim.api.nvim_create_user_command("AutoFormatToggle", function(args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = not vim.b.disable_autoformat
    else
        vim.g.disable_autoformat = not vim.g.disable_autoformat
    end
end, {
    desc = "Toggle format on save",
    bang = true,
})

require("which-key").add({
    { "<leader>f",  group = "Conform" },
    { "<leader>fb", ":AutoFormatToggle!<CR>", desc = "Toggle autoformat for buffer" },
    { "<leader>fg", ":AutoFormatToggle<CR>",  desc = "Toggle autoformat globally" },
})
