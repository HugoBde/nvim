return {

    -- telescope my beloved
    {
        "nvim-telescope/telescope.nvim",
        tag = "v0.2.0",

        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build =
                "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
            }
        }
    },

    -- Nvim Tree Sitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    -- colorscheme
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                commentStyle = {
                    italic = false
                },
                background = {
                    dark = "dragon",
                    light = "lotus"
                }
            })
            vim.cmd("colorscheme kanagawa")
        end
    },
    {
        "EdenEast/nightfox.nvim",
        -- config = function()
        --     vim.cmd("colorscheme carbonfox")
        -- end
    },

    -- LSP stuff
    { 'neovim/nvim-lspconfig' },

    {
        'williamboman/mason.nvim',
        dependencies = {
            { 'williamboman/mason-lspconfig.nvim' },
        },
        build = function()
            ---@diagnostic disable-next-line: param-type-mismatch
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },

    -- Autocompletion
    -- {
    --     'hrsh7th/nvim-cmp',
    --     dependencies = {
    --         { 'hrsh7th/cmp-nvim-lsp' },
    --         { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    --         { 'hrsh7th/cmp-path' },
    --         { 'hrsh7th/cmp-buffer' },
    --     }
    -- },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
        version = "1.*",
        opts = {
            keymap = {
                preset = "enter",
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
                ["<C-h>"] = { "show_signature", "hide_signature", "fallback" },
            },
            completion = {
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true
                    }
                },
                ghost_text = {
                    enabled = true,
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500
                },
                menu = {
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind" }
                        }
                    }
                }
            },
            signature = { enabled = true }
        }
    },


    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },

    -- easy comments
    {
        "numToStr/Comment.nvim",
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring'
        },
        config = function()
            require("Comment").setup({
                mappings = {
                    extra = false
                },
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            })
        end,
        lazy = false
    },

    -- autopair brackets
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- trouble.nvim
    {
        "folke/trouble.nvim",
        opts = {
            icons = {
                fold_open = "",
                fold_closed = "",
            },
            keys = {
                ["<esc>"] = "close"
            },
            indent_lines = false,
            signs = {
                error       = "󰀨",
                warning     = "󰀦",
                hint        = "󰌵",
                information = ""
            },
            multiline = true,
            use_diagnostic_signs = false,
            auto_open = false,
            auto_close = true,
            auto_fold = true,
            auto_jump = false,
            focus = true,
            open_no_results = true,
        },
    },

    -- Which key (seems pretty fkn cool)
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            marks = false,
            registers = false,
            icons = {
                breadcrumb = "󰄾",
                separator = "",
                group = "󰆧 "
            },
            win = {
                border = "rounded",
            }
        }
    },

    -- Indent blankline
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("ibl").setup(
            ---@module "ibl"
            ---@type ibl.config
                {
                    indent = {
                        char = "│"
                    },
                    scope = {
                        enabled = false
                    }
                })
        end
    },

    -- undo highlight
    {
        'tzachar/highlight-undo.nvim',
        config = function()
            require('highlight-undo').setup({
                duration = 500
            })
        end
    },

    -- undo tree
    {
        "mbbill/undotree"
    },

    -- barbecue nvim (context bar)
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
        },
        opts = {
            symbols = {
                modified = "●",
                ellipsis = "…",
                separator = ""
            },
        },
    },

    -- lua line
    {
        "nvim-lualine/lualine.nvim"
    },

    -- bringing back ufo to fold code
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async"
        }
    },

    -- null ls to get formatting
    {
        'stevearc/conform.nvim',
    },

    -- nvim ts autotags
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- surround
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- Nvim plugin dev
    {
        "folke/neodev.nvim",
        opts = {}
    },

    {
        "kdheepak/monochrome.nvim",
        -- config = function()
        --     vim.g.monochrome_style = "subtle"
        --     vim.cmd "colorscheme monochrome"
        -- end
    },

    {
        "rayliwell/tree-sitter-rstml",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        }
    },

    {
        "metalelf0/black-metal-theme-neovim",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     require("black-metal").setup({
        --         theme = "bathory"
        --     })
        --     require("black-metal").load()
        -- end
    },
}
