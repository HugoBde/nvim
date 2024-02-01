local palette = require("kanagawa.colors").setup().palette

local autoformat_component = function()
    return "󰳼"
end

local function kanagawa()
    return {
        normal = {
            a = { bg = palette.dragonBlue2, fg = palette.dragonBlack3 },
            b = { bg = colors.lightgray, fg = colors.white },
            c = { bg = colors.darkgray, fg = colors.gray }
        },
        insert = {
            a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
            b = { bg = colors.lightgray, fg = colors.white },
            c = { bg = colors.lightgray, fg = colors.white }
        },
        visual = {
            a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
            b = { bg = colors.lightgray, fg = colors.white },
            c = { bg = colors.inactivegray, fg = colors.black }
        },
        replace = {
            a = { bg = colors.red, fg = colors.black, gui = 'bold' },
            b = { bg = colors.lightgray, fg = colors.white },
            c = { bg = colors.black, fg = colors.white }
        },
        command = {
            a = { bg = colors.green, fg = colors.black, gui = 'bold' },
            b = { bg = colors.lightgray, fg = colors.white },
            c = { bg = colors.inactivegray, fg = colors.black }
        },
        inactive = {
            a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
            b = { bg = colors.darkgray, fg = colors.gray },
            c = { bg = colors.darkgray, fg = colors.gray }
        }
    }
end

require("lualine").setup({
    options = {
        section_separators = "",
        component_separators = "",
        theme = "codedark", -- todo: make it match colorscheme
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
                newfile_status = true,
                path = 1,
                symbols = {
                    modified = "●",
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
        lualine_y = {
            {
                autoformat_component,
                color = function(_)
                    if vim.g.disable_autoformat or vim.b.disable_autoformat then
                        return "DiagnosticError"
                    end

                    return "DiagnosticOk"
                end,
            },
        },
        lualine_z = {
            {
                "location",
                fmt = function(str)
                    local vals = string.gmatch(str, "%d+")
                    local ln = tostring(vals())
                    local col = tostring(vals())
                    return "Ln: " .. ln .. " Col: " .. col
                end,
            },
        },
    },
})
