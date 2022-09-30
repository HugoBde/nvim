return require("packer").startup(function(use)
    -- Nvim Packer
	use("wbthomason/packer.nvim")

    -- Nvim Tree Sitter
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdata"})

    -- Nvim LSP Config: LSP configs provided by NeoVim
    use("neovim/nvim-lspconfig")
    
    -- lsp-status: show LSP info in the status bar
    -- To be installed once you get to the status bar
    -- use("nvim-lua/lsp-status.nvim")
    
    -- Coq Nvim: autocompletion and code snippets
    use("ms-jpq/coq-nvim")
    use("ms-jpq/coq.artifacts")

    -- Gruvbox colorscheme: make NeoVim Pwetty UwU
    use("ellisonleao/gruvbox.nvim")

    -- Indentation lines
    use("lukas-reineke/indent-blankline.nvim")

    -- Discord presence to flex on other people
    use("andweeb/presence.nvim")

    -- File Explorer
    use({'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}})
end)
