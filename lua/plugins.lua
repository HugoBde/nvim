return {

    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.0",
        dependencies = { { "nvim-lua/plenary.nvim" } }
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
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
        }
    },

    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp"
    },

    -- gitsigns
    "lewis6991/gitsigns.nvim",

    -- easy comments
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    },

    -- autoclose brackets
    {
        "m4xshen/autoclose.nvim",
        config = function()
            require("autoclose").setup()
        end
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
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }

}
