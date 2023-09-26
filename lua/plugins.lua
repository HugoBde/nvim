return {

    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    },

    -- Nvim Tree Sitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },

    -- Nvim UFO (code folding)
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { { "kevinhwang91/promise-async" } }
    },

    -- colorscheme
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        config = function()
            require("kanagawa").setup({
                dimInactive = true,
                background = {
                    dark = "dragon",
                    light = "lotus"
                }
            })
        end
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
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-nvim-lua' },
        }
    },

    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
        dependencies = {
            { "saadparwaiz1/cmp_luasnip" },
            { "rafamadriz/friendly-snippets" }
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
        config = function()
            require("Comment").setup({
                mappings = {
                    extra = false
                },
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

    -- discord presence
    {
        "andweeb/presence.nvim"
    },

    -- trouble.nvim
    {
        "folke/trouble.nvim",
        opts = {
            icons = false,
            fold_open = "v",
            fold_closed = ">",
            indent_lines = false,
            signs = {
                error = "X",
                warning = "!",
                hint = "?",
                information = "*"
            },
            multiline = false,
            use_diagnostic_signs = false,
            auto_open = false,
            auto_close = true,
            auto_fold = true
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
            icons = {
                separator = ">",
                group = ""
            }
        }
    },

    -- Indent blankline
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                show_first_indent_level = false,
                char_blankline = '',
            })
        end
    },

    -- references highlight
    {
        'tzachar/local-highlight.nvim',
        config = function()
            require('local-highlight').setup()
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
                separator = ">"
            },
            kinds = false
        },
    },

    -- lua line
    {
        "nvim-lualine/lualine.nvim"
    }
}
