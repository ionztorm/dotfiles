return {
	{
		"echasnovski/mini.nvim",
		config = function()
			local statusline = require("mini.statusline")
			local icons = require("mini.icons")
			local pairs = require("mini.pairs")
			local indentscope = require("mini.indentscope")
			local cursorword = require("mini.cursorword")
			local hipatterns = require("mini.hipatterns")
			local ai = require("mini.ai")
			local surround = require("mini.surround")

			-- configuration funcs

			local content_active = function()
				local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
				local git = statusline.section_git({ trunc_width = 40 })
				local diff = statusline.section_diff({ trunc_width = 75 })
				local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
				local lsp = statusline.section_lsp({ trunc_width = 75 })
				-- Always show truncated file name (i.e. relative to current working directory)
				local filename = statusline.section_filename({ trunc_width = 9999 })
				local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
				local location = statusline.section_location({ trunc_width = 75 })
				local search = statusline.section_searchcount({ trunc_width = 75 })

				return statusline.combine_groups({
					{ hl = mode_hl, strings = { mode } },
					{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
					"%<", -- Mark general truncate point
					{ hl = "MiniStatuslineFilename", strings = { filename } },
					"%=", -- End left alignment
					{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
					{ hl = mode_hl, strings = { search, location } },
				})
			end

			-- setups
			icons.setup({})
			statusline.setup({ use_icons = true, content = { active = content_active } })
			ai.setup({ n_lines = 500 })
			pairs.setup({
				modes = { insert = true, command = true, terminal = false },
				skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
				skip_ts = { "string" },
				skip_unbalanced = true,
				markdown = true,
			})
			indentscope.setup({
				symbol = "│",
				options = { try_as_border = true },
			})
			cursorword.setup()
			hipatterns.setup({
				highlighters = {
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
			surround.setup({})
		end,
	},
}
