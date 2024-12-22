local M = {}

M.formatters = {}
M.formatter_configs = {}

M.add_formatter = function(language, formatter)
    M.formatters[language] = formatter
end

M.add_formatter_config = function(formatter, config)
    M.formatter_configs[formatter] = config
end

M.get_formatters = function()
    return M.formatters
end

M.get_formatter_configs = function()
    return M.formatter_configs
end

M.get_formatter_names = function()
    local formatter_names = {}
    for _, formatter in pairs(M.formatters) do
        table.insert(formatter_names, formatter)
    end
    return formatter_names
end

return M