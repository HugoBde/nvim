local kana = require("kanagawa.colors").setup()

local lualine_kanagawa_theme = {
    normal = {
        a = { bg = kana.theme.syn.fun, fg = kana.theme.ui.bg_m3 },
        b = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.syn.fun },
        c = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.ui.fg },
        x = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.syn.fun },
    },
    insert = {
        a = { bg = kana.theme.diag.ok, fg = kana.theme.ui.bg },
        b = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.diag.ok },
        x = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.diag.ok },
    },
    command = {
        a = { bg = kana.theme.syn.operator, fg = kana.theme.ui.bg },
        b = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.syn.operator },
        x = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.syn.operator },
    },
    visual = {
        a = { bg = kana.theme.syn.keyword, fg = kana.theme.ui.bg },
        b = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.syn.keyword },
        x = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.syn.keyword },
    },
    replace = {
        a = { bg = kana.theme.syn.constant, fg = kana.theme.ui.bg },
        b = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.syn.constant },
        x = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.syn.constant },
    },
    inactive = {
        a = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.ui.fg_dim },
        b = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.ui.fg_dim, gui = "bold" },
        c = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.ui.fg_dim },
        x = { bg = kana.theme.ui.bg_gutter, fg = kana.theme.ui.fg_dim, gui = "bold" },
    }
}

local autoformat_component = function()
    if vim.g.disable_autoformat or vim.b.disable_autoformat then
        return "OFF"
    end

    return "ON"
end

require("lualine").setup({
    options = {
        section_separators = "",
        component_separators = "",
        theme = lualine_kanagawa_theme
    },
    sections = {
        lualine_a = {
            {
                "mode",
            },
        },
        lualine_b = {
            {
                "branch",
            },
            {
                "diff",
            },
        },
        lualine_c = {
            {
                "filename",
                path = 1,
                symbols = {
                    modified = "● ",
                    readonly = "󰌾",
                },
            },
        },

        lualine_x = {
            {
                "diagnostics",
                icons_enabled = true,
                symbols = {
                    error = "󰀨 ",
                    warn = "󰀦 ",
                },
                sections = { "error", "warn" },
                update_in_insert = true,
                always_visible = true,
            },
        },
        lualine_y = {
            {
                autoformat_component,
                icon = "󰳼",
                color = function(_)
                    if vim.g.disable_autoformat or vim.b.disable_autoformat then
                        return { fg = kana.palette.dragonRed }
                    end

                    return { fg = kana.palette.dragonGreen2 }
                end
            },
            {
                "filetype",
                fmt = function(str)
                    local better_filetypes = {
                        c = "C",
                        cpp = "C++",
                        rust = "Rust",
                        cs = "C#",
                        typescriptreact = "TSX",
                        javascriptreact = "JSX",
                        typescript = "TS",
                        javascript = "JS",
                        lua = "Lua",
                        go = "Go",
                        ocaml = "OCaml",
                        -- Add more filetypes here if needed
                    }

                    return better_filetypes[str] or str
                end,
            },
        },
        lualine_z = {
            {
                "location"
            },
        },
    },
})
