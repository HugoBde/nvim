local utils = {}

utils.merge_tables = function(table_a, table_b)
    local out = {}
    for key, value in pairs(table_a) do
        out[key] = value
    end
    for key, value in pairs(table_b) do
        out[key] = value
    end

    return out
end


return utils
