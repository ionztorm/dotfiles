-- utilities.lua
local M = {}

-- Combine any number of tables into one table
M.combine_tables = function(...)
    local combined = {}
    for _, tbl in ipairs({...}) do
        if type(tbl) == "table" then
            for _, value in ipairs(tbl) do
                table.insert(combined, value)
            end
        end
    end
    return combined
end

return M