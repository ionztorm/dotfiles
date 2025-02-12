-- Ensure _G.Statusline exists
_G.Statusline = _G.Statusline or {}
_G.Statusline.message = "" -- Initialize message to prevent nil errors

-- Function to safely get highlight colors from the active theme
_G.Statusline.get_hl = function(group, attr)
	local hl = vim.api.nvim_get_hl(0, { name = group, link = false }) or {}
	return hl[attr] and string.format("#%06x", hl[attr]) or nil
end

-- Dynamically set colors based on active theme
_G.Statusline.set_colors = function()
	local bg = _G.Statusline.get_hl("StatusLine", "background") or "#1E1E2E"
	local fg = _G.Statusline.get_hl("StatusLine", "foreground") or "#D9E0EE"
	local mode_fg = _G.Statusline.get_hl("ModeMsg", "foreground") or "#89B4FA"
	local git_fg = _G.Statusline.get_hl("GitSignsAdd", "foreground") or "#A6E3A1"
	local diag_err_fg = _G.Statusline.get_hl("DiagnosticError", "foreground") or "#F38BA8"
	local diag_warn_fg = _G.Statusline.get_hl("DiagnosticWarn", "foreground") or "#FAB387"

	-- Define highlight groups dynamically
	vim.cmd("highlight StatusModeNormal guifg=" .. bg .. " guibg=" .. mode_fg .. " gui=bold")
	vim.cmd("highlight StatusModeInsert guifg=" .. bg .. " guibg=#A6E3A1 gui=bold")
	vim.cmd("highlight StatusModeVisual guifg=" .. bg .. " guibg=#FAB387 gui=bold")
	vim.cmd("highlight StatusModeReplace guifg=" .. bg .. " guibg=#F38BA8 gui=bold")
	vim.cmd("highlight StatusModeCommand guifg=" .. bg .. " guibg=#CBA6F7 gui=bold")
	vim.cmd("highlight StatusGit guifg=" .. git_fg .. " guibg=" .. bg .. " gui=bold")
	vim.cmd("highlight StatusFile guifg=" .. fg .. " guibg=" .. bg .. " gui=bold")
	vim.cmd("highlight StatusCursor guifg=" .. fg .. " guibg=" .. bg .. " gui=bold")
	vim.cmd("highlight StatusDiagError guifg=" .. diag_err_fg .. " guibg=" .. bg .. " gui=bold")
	vim.cmd("highlight StatusDiagWarn guifg=" .. diag_warn_fg .. " guibg=" .. bg .. " gui=bold")
end

-- Update colors when colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		_G.Statusline.set_colors()
	end,
})

-- Run once at startup
_G.Statusline.set_colors()

-- Function to display mode with colors & icons
_G.Statusline.mode = function()
	local modes = {
		n = "%#StatusModeNormal#  NOR » %#StatusFile#",
		i = "%#StatusModeInsert#  INS » %#StatusFile#",
		v = "%#StatusModeVisual#  VIS » %#StatusFile#",
		V = "%#StatusModeVisual#  V-L » %#StatusFile#",
		[""] = "%#StatusModeVisual#  V-B » %#StatusFile#",
		R = "%#StatusModeReplace#  REPE » %#StatusFile#",
		c = "%#StatusModeCommand#  CMD » %#StatusFile#",
	}
	return modes[vim.api.nvim_get_mode().mode] or "%#StatusModeNormal#  NORMAL » %#StatusFile#"
end

-- Function to get Git branch dynamically
_G.Statusline.git_branch = function()
	local branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD 2>/dev/null")[1] or ""
	return branch ~= "" and "%#StatusGit#  " .. branch .. " " or ""
end

-- Function to check for unstaged Git changes (✗)
_G.Statusline.git_dirty = function()
	local dirty_count = vim.fn.systemlist("git status --porcelain 2>/dev/null | wc -l")[1]
	return (dirty_count and tonumber(dirty_count) > 0) and "✗ " or ""
end

-- Function to get LSP diagnostics
_G.Statusline.lsp_diagnostics = function()
	local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local diag_str = ""

	if errors > 0 then
		diag_str = diag_str .. "%#StatusDiagError#  " .. errors
	end
	if warnings > 0 then
		diag_str = diag_str .. "%#StatusDiagWarn#  " .. warnings
	end

	return diag_str ~= "" and "%#StatusCursor# " .. diag_str .. " %#StatusFile#" or ""
end

-- Function to temporarily show messages in statusline
_G.Statusline.update_message = function()
	local last_msg = vim.fn.execute("messages") -- Get the last message
	local lines = vim.split(last_msg, "\n") -- Split into lines
	_G.Statusline.message = lines[#lines] or "" -- Ensure message is not nil

	vim.cmd("redrawstatus") -- Refresh to show message

	-- Restore after 3 seconds
	vim.defer_fn(function()
		if _G.Statusline.message == lines[#lines] then
			_G.Statusline.message = "" -- Only clear if it's the same message
			vim.cmd("redrawstatus") -- Refresh statusline
		end
	end, 3000)
end

-- Auto command to capture messages and update statusline
vim.api.nvim_create_autocmd("CmdlineLeave", {
	callback = function()
		_G.Statusline.update_message()
	end,
})

-- Function to dynamically update statusline content
_G.Statusline.dynamic_statusline = function()
	if vim.fn.getcmdwintype() ~= "" then
		return " " -- Hide statusline when command mode is active
	elseif _G.Statusline.message ~= "" then
		return "%#StatusFile#" .. _G.Statusline.message -- Show message instead of file path
	else
		return "%{%v:lua.Statusline.mode()%}  %f %= %{%v:lua.Statusline.lsp_diagnostics()%}%{%v:lua.Statusline.git_branch()%}%{%v:lua.Statusline.git_dirty()%}%#StatusCursor#  %c/%l " -- **Restored original layout**
	end
end

-- Apply the dynamic statusline
vim.o.statusline = "%{%v:lua.Statusline.dynamic_statusline()%}"

-- Refresh statusline when entering/exiting command mode
vim.api.nvim_create_autocmd("CmdlineEnter", {
	callback = function()
		vim.cmd("redrawstatus")
	end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	callback = function()
		vim.cmd("redrawstatus")
	end,
})
