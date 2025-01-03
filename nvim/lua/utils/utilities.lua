-- utilities.lua
local M = {}

-- Combine any number of tables into one table
M.combine_tables = function(...)
	local combined = {}
	for _, tbl in ipairs({ ... }) do
		if type(tbl) == "table" then
			for _, value in ipairs(tbl) do
				table.insert(combined, value)
			end
		end
	end
	return combined
end

M.mason_ensure_installed = function(tools)
	local mr = require("mason-registry")
	mr.refresh(function()
		for _, tool in ipairs(tools) do
			-- Replace 'ts_ls' with 'tailwind-language-server'
			if tool == "ts_ls" then
				tool = "typescript-language-server"
			end
			if tool == "tailwindcss" then
				tool = "tailwind-language-server"
			end

			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
	end)
end

return M
