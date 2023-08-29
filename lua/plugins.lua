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

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
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
}
