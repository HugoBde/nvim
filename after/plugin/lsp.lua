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

        require("which-key").register({
                ["<leader>"] = {
                    v = {
                        name = "lsp",
                        w = { vim.lsp.buf.workspace_symbol, "workspace symbols" },
                        d = { vim.diagnostic.open_float, "open diagnostic float" },
                        c = { vim.lsp.buf.code_action, "show code actions" },
                        r = { vim.lsp.buf.references, "show references" },
                        n = { vim.lsp.buf.rename, "rename symbol" }
                    }
                },
                g = {
                    d = { vim.lsp.buf.definition, "go to definition" },
                    D = { function()
                        vim.cmd("vsplit")
                        vim.lsp.buf.definition()
                    end, "go to definition in vsplit" },
                    f = { vim.lsp.buf.declaration, "go to declaration" },
                    F = { function()
                        vim.cmd("vsplit")
                        vim.lsp.buf.declaration()
                    end, "go to declaration in vsplit" },
                    t = { vim.lsp.buf.type_definition, "go to type definition" },
                    T = { function()
                        vim.cmd("vsplit")
                        vim.lsp.buf.type_definition()
                    end, "go to type definition in vsplit" }
                },
                K = { vim.lsp.buf.hover, "hover" },
            },
            {
                buffer = bufnr
            })

        -- If editing a c or header file for work, don't setup autoformattng
        local file_extension = utils.get_file_extension(event.file)

        if (file_extension == ".c" or file_extension == ".h") then
            return
        end

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
    eslint = {
        on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
            })
        end,
        settings = {
            codeActionOnSave = {
                enable = true,
                mode = "all"
            }
        }
    },
    html = {},
    jsonls = {},
    lua_ls = {},
    tsserver = {},
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
