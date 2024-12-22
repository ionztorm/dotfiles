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
	for _, linter in pairs(M.linters) do
		table.insert(linter_names, linter)
	end
	return linter_names
end

return M
