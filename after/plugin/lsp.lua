local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_format_on_save = function(bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end
    })
end

local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    "clangd",
    "cssls",
    "dockerls",
    "docker_compose_language_service",
    "eslint",
    "gopls",
    "html",
    "jsonls",
    "marksman",
    "rust_analyzer",
    "taplo",
    "yamlls",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<CR>"] = cmp.mapping({
        i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
            else
                fallback()
            end
        end,
        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp.setup({
    mapping = cmp_mappings,
    preselect = cmp.PreselectMode.None
})

lsp.on_attach(function(client, bufnr)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        { buffer = bufnr, remap = false, desc = "Go to definition" })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false, desc = "More info" })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        { buffer = bufnr, remap = false, desc = "Workspace symbol??" })
    vim.keymap.set("n", "<leader>vd", function() vim.lsp.diagnostic.open_float() end,
        { buffer = bufnr, remap = false, desc = "Open float??" })
    vim.keymap.set("n", "[d", function() vim.lsp.buf.goto_next() end,
        { buffer = bufnr, remap = false, desc = "Go to next" })
    vim.keymap.set("n", "]d", function() vim.lsp.buf.goto_prev() end,
        { buffer = bufnr, remap = false, desc = "Go to prev" })
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
        { buffer = bufnr, remap = false, desc = "Execute code action" })
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
        { buffer = bufnr, remap = false, desc = "List references" })
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
        { buffer = bufnr, remap = false, desc = "Rename symbol" })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        { buffer = bufnr, remap = false, desc = "Signature help" })

    lsp_format_on_save(bufnr)
end)


local lsp_config = require("lspconfig")

lsp_config.lua_ls.setup(lsp.nvim_lua_ls())
lsp_config.zls.setup({})
lsp_config.rust_analyzer.setup({
    settings = {
        ["rust_analyzer"] = {
            check = {
                command = "clippy"
            }
        }
    }
})
lsp_config.omnisharp.setup({})

lsp.setup()
