vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- vim.o.statuscolumn = '%=%l%s%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "v" : ">") : " " }'

-- require('ufo').setup({
--     provider_selector = function(bufnr, filetype, buftype)
--         return { 'treesitter', 'indent' }
--     end
-- })
