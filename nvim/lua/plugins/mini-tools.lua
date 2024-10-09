return {
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = "BufEnter",
		config = function()
			require("mini.indentscope").setup({
				symbol = "│",
				options = { try_as_border = true },
			})
		end,
	},
	{
		"echasnovski/mini.cursorword",
		version = false,
		lazy = true,
		event = "CursorMoved",
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		opts = {},
		config = function()
			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
		end,
	},
}
