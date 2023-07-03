return require("packer").startup(function(use)
    -- Nvim Packer
    use("wbthomason/packer.nvim")

    use { "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } }

    -- Nvim Tree Sitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Discord presence to flex on other people
    use("andweeb/presence.nvim")

    -- colorscheme
    use { "rebelot/kanagawa.nvim" }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use({
        "numToStr/Comment.nvim",
        config = function()
            print("hello??")
            require("Comment").setup()
        end
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
