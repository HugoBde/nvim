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

utils.get_keys = function(table_a)
    local keys = {}
    for key, _ in pairs(table_a) do
        table.insert(keys, key)
    end
    return keys
end


return utils
