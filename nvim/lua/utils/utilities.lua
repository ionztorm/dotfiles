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

M.live_preview_status = false

M.toggle_live_preview = function()
	if M.live_preview_status then
		vim.cmd("LivePreview close")
		M.live_preview_status = false
		print("LivePreview stopped")
	else
		-- Get the current buffer's file path
		local filepath = vim.api.nvim_buf_get_name(0)

		-- Ensure there's a valid file before starting the preview
		if filepath == "" or filepath == nil then
			print("Error: No file detected for LivePreview.")
			return
		end

		-- Escape spaces in filepath
		local escaped_filepath = vim.fn.fnameescape(filepath)

		-- Simulate manually typing the command and pressing Enter
		vim.api.nvim_feedkeys(":LivePreview start " .. escaped_filepath .. "\n", "n", false)

		-- Ensure UI updates
		vim.defer_fn(function()
			vim.cmd("redraw!")
		end, 100)

		M.live_preview_status = true
		print("LivePreview started for: " .. filepath)
	end
end

return M
