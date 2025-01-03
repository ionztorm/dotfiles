local M = {}

M.linters = {}

M.add_linter = function(language, linter)
	M.linters[language] = linter
end

M.get_linters = function()
	return M.linters
end

M.get_linter_names = function()
	local linter_names = {}
	for _, linter_table in pairs(M.linters) do
		for _, linter in ipairs(linter_table) do
			table.insert(linter_names, linter)
		end
	end
	return linter_names
end

return M
