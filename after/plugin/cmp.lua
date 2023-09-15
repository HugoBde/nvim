local cmp = require("cmp")
local luasnip = require("luasnip") -- snippet engine

cmp.setup({
    -- Configure snippet engine
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },

    mapping = {
        ["<C-Up>"] = cmp.mapping(function(fallback)
            if not cmp.scroll_docs(-4) then
                fallback()
            end
        end, { "i", "s" }),

        ["<C-Down>"] = cmp.mapping(function(fallback)
            if not cmp.scroll_docs(4) then
                fallback()
            end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<C-Space>"] = cmp.mapping.complete(),
    },

    -- Configure completion sources
    -- not entirely sure why we are passing
    -- two tables but whatever
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    }),

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },

    preselect = cmp.PreselectMode.None
})
