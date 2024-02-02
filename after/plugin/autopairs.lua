local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local npairs = require('nvim-autopairs')

local rule2 = function(a1, ins, a2, lang)
    npairs.add_rule(
        Rule(ins, ins, lang)
        :with_pair(function(opts) return a1 .. a2 == opts.line:sub(opts.col - #a1, opts.col + #a2 - 1) end)
        :with_move(cond.none())
        :with_cr(cond.none())
        :with_del(function(opts)
            local col = vim.api.nvim_win_get_cursor(0)[2]
            return a1 .. ins .. ins .. a2 ==
                opts.line:sub(col - #a1 - #ins + 1, col + #ins + #a2) -- insert only works for #ins == 1 anyway
        end)
    )
end

rule2('(', '*', ')', 'ocaml')
rule2('(*', ' ', '*)', 'ocaml')
rule2('(', ' ', ')')

npairs.get_rules("'")[1].not_filetypes = { "ocaml" }

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
