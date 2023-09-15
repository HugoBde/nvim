-- Set up some stuff when an LSP ataches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "lsp Attach Actions",

    callback = function(event)
        local bufnr = event.buf

        -- Set a bunch of keymaps
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
            { buffer = bufnr, remap = false, desc = "go to definition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
            { buffer = bufnr, remap = false, desc = "more info" })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
            { buffer = bufnr, remap = false, desc = "workspace symbol??" })
        vim.keymap.set("n", "<leader>vd", function() vim.lsp.diagnostic.open_float() end,
            { buffer = bufnr, remap = false, desc = "open float??" })
        vim.keymap.set("n", "[d", function() vim.lsp.buf.goto_next() end,
            { buffer = bufnr, remap = false, desc = "go to next" })
        vim.keymap.set("n", "]d", function() vim.lsp.buf.goto_prev() end,
            { buffer = bufnr, remap = false, desc = "go to prev" })
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
            { buffer = bufnr, remap = false, desc = "execute code action" })
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
            { buffer = bufnr, remap = false, desc = "list references" })
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
            { buffer = bufnr, remap = false, desc = "rename symbol" })
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
            { buffer = bufnr, remap = false, desc = "signature help" })

        -- Set up autoformattng
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format()
            end
        })
    end

})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "clangd",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "eslint",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "omnisharp",
        "pyright",
        "rust_analyzer",
        "taplo",
        "tsserver",
        "yamlls",
    }
})

local lsp_config = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp_config.clangd.setup({ capabilities = capabilities, })
lsp_config.cssls.setup({ capabilities = capabilities, })
lsp_config.dockerls.setup({ capabilities = capabilities, })
lsp_config.docker_compose_language_service.setup({ capabilities = capabilities, })
lsp_config.eslint.setup({ capabilities = capabilities, })
lsp_config.tsserver.setup({ capabilities = capabilities, })
lsp_config.gopls.setup({ capabilities = capabilities, })
lsp_config.html.setup({ capabilities = capabilities, })
lsp_config.jsonls.setup({ capabilities = capabilities, })
lsp_config.lua_ls.setup({ capabilities = capabilities })
lsp_config.marksman.setup({ capabilities = capabilities, })
lsp_config.omnisharp.setup({ capabilities = capabilities, })
lsp_config.pyright.setup({ capabilities = capabilities, })
lsp_config.rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        ["rust_analyzer"] = {
            check = {
                command = "clippy"
            }
        }
    }
})
lsp_config.taplo.setup({ capabilities = capabilities, })
lsp_config.yamlls.setup({ capabilities = capabilities, })
