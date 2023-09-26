local utils = require("utils")

-- Make borders rounded for Hover and Signature Help
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
)

vim.diagnostic.config({
    float = {
        border = "rounded"
    }
})

-- Set up some stuff when an LSP ataches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "lsp Attach Actions",

    callback = function(event)
        local bufnr = event.buf

        -- Set a bunch of keymaps
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
            { buffer = bufnr, remap = false, desc = "go to definition" })
        vim.keymap.set("n", "gD", ":vsplit | lua vim.lsp.buf.definition()",
            { buffer = bufnr, remap = false, desc = "go to definition in split" })
        vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end,
            { buffer = bufnr, remap = false, desc = "go to type definition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
            { buffer = bufnr, remap = false, desc = "more info" })
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
            { buffer = bufnr, remap = false, desc = "workspace symbol??" })
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
            { buffer = bufnr, remap = false, desc = "open diagnostics" })
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

local lsps = {
    clangd = {},
    cssls = {},
    dockerls = {},
    docker_compose_language_service = {},
    eslint = {
        on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
            })
        end
    },
    gopls = {},
    html = {},
    jsonls = {},
    lua_ls = {},
    marksman = {},
    omnisharp = {},
    pyright = {},
    rust_analyzer = {
        settings = {
            ["rust_analyzer"] = {
                check = {
                    command = "clippy"
                }
            }
        }
    },
    taplo = {},
    tsserver = {},
    yamlls = {}
}

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = utils.get_keys(lsps)
})

local lsp_config = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for lsp, opts in pairs(lsps) do
    opts.capabilities = capabilities
    lsp_config[lsp].setup(opts)
end
