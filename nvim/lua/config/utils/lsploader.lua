-- This module provides functionality to manage and load LSP server configurations.

-- Define a module table
local M = {}

-- Store a list of server configurations
M.configs = {}

-- Function to add a server and its configuration to the list
-- @param server string: Name of the LSP server
-- @param config table: Configuration for the LSP server
-- @usage
-- lsploader.add_server("pyright", {settings = {python = {analysis = {typeCheckingMode = "strict"}}}})
-- Adds the "pyright" server with the specified configuration.
function M.add_config(server, config)
    M.configs[server] = config
end

-- Function to get the names of all registered servers
-- @return table: List of server names
-- @usage
-- local server_names = lsploader.get_server_names()
-- Returns a table containing the names of all registered LSP servers.
function M.get_server_names()
    local server_names = {}
    for server, _ in pairs(M.configs) do
        table.insert(server_names, server)
    end
    return server_names
end

-- Function to load language configurations from the specified directory
-- This function scans the specified directory for Lua files, attempts to load them as modules,
-- and invokes them with the module table as an argument if they are valid functions.
-- @usage
-- lsploader.load_language_configs()
-- Automatically loads language configurations from the predefined directory.
function M.load_language_configs()
    local base_path = "config.languages" -- Base module path for the language configs
    local lua_path = vim.fn.stdpath("config") .. "/lua/" .. base_path:gsub("%.", "/") -- Actual file path
    local files = vim.fn.glob(lua_path .. "/*.lua", false, true) -- Find all .lua files

    for _, file in ipairs(files) do
        local module_name = base_path .. "." .. file:match("([^/]+)%.lua$")
        local ok, lang_config = pcall(require, module_name)
        if ok and type(lang_config) == "function" then
            lang_config(M)
        else
            vim.notify("Error loading LSP config: " .. module_name, vim.log.levels.ERROR)
        end
    end
end

return M

