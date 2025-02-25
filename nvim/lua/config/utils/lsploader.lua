local M = {}

M.configs = {}

function M.add_config(server, config)
	M.configs[server] = config
end

function M.get_server_names()
	local server_names = {}
	for server, _ in pairs(M.configs) do
		table.insert(server_names, server)
	end
	return server_names
end

function M.load_language_configs()
	local base_path = "config.languages"
	local lua_path = vim.fn.stdpath("config") .. "/lua/" .. base_path:gsub("%.", "/")
	local files = vim.fn.glob(lua_path .. "/*.lua", false, true)

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
