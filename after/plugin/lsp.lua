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
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
            { buffer = bufnr, remap = false, desc = "signature help" })

        -- rewrite the following to use the updated which-key.nvim spec
        require("which-key").add({
            {
                buffer = bufnr,
                { "<leader>v",  group = "lsp" },
                { "<leader>vc", vim.lsp.buf.code_action,      desc = "show code actions" },
                { "<leader>vd", vim.diagnostic.open_float,    desc = "open_diagnostic float" },
                { "<leader>vn", vim.lsp.buf.rename,           desc = "rename symbol" },
                { "<leader>vr", vim.lsp.buf.references,       desc = "show references" },
                { "<leader>vw", vim.lsp.buf.workspace_symbol, desc = "workspace symbols" },
                { "K",          vim.lsp.buf.hover,            desc = "hover" },
                { "gd",         vim.lsp.buf.definition,       desc = "go to definition" },
                {
                    "gD",
                    function()
                        vim.cmd.vsplit()
                        vim.lsp.buf.definition()
                    end,
                    desc = "go to definition in vsplit"
                },
                { "gf", vim.lsp.buf.declaration,     desc = "go to declaration" },
                {
                    "gF",
                    function()
                        vim.cmd.vsplit()
                        vim.lsp.buf.declaration()
                    end,
                    desc = "go to declaration in vsplit"
                },
                { "gt", vim.lsp.buf.type_definition, desc = "go to type definition" },
                {
                    "gT",
                    function()
                        vim.cmd.vsplit()
                        vim.lsp.buf.type_definition()
                    end,
                    desc = "go to type definition in vsplit"
                },
            }
        })
    end
})

local lsps = {
    clangd = {},
    cssls = {},
    dockerls = {},
    docker_compose_language_service = {},
    elixirls = {
        cmd = { "/home/bde/Programs/elixir-ls/language_server.sh" }
    },
    eslint = {
        --     on_attach = function(_, bufnr)
        --         vim.api.nvim_create_autocmd("BufWritePre", {
        --             buffer = bufnr,
        --             command = "EslintFixAll",
        --         })
        --     end
    },
    gleam = {},
    gopls = {},
    html = {},
    htmx = {
        filetypes = { "html", "templ" },
    },
    jsonls = {},
    lua_ls = {},
    marksman = {},
    omnisharp = {},
    ocamllsp = {},
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
    templ = {},
    -- typos_lsp = {
    --     init_options = {
    --         diagnosticSeverity = "warn"
    --     }
    -- },
    tailwindcss = {
        filetypes = {
            "html",
            "templ",
            "astro",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "react"
        },
        init_options = { userLanguages = { templ = "html" } },
    },
    tsserver = {},
    yamlls = {},
}

require('mason').setup()
-- require('mason-lspconfig').setup({
--     ensure_installed = utils.get_keys(lsps)
-- })

-- setup neodev before lspconfig
require("neodev").setup({})

local lsp_config = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for lsp, opts in pairs(lsps) do
    opts.capabilities = capabilities
    lsp_config[lsp].setup(opts)
end
