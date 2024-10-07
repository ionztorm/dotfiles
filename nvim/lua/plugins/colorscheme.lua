return {

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				terminal_colors = true,
				styles = {
					floats = "transparent",
					sidebars = "transparent",
				},
			})
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				tranrparent_mode = true,
				undercurl = true,
				underline = true,
				transparent_mode = true,
			})
			-- vim.o.background = "dark"
			-- vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				flavour = "mocha",
				integrations = {
					cmp = true,
					telescope = true,
					treesitter = true,
					treesitter_context = true,
					indent_blankline = {
						enabled = false,
						scope_color = "sapphire",
						colored_indent_levels = false,
					},
					mason = true,
					native_lsp = { enabled = true },
				},
			})
			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"olivercederborg/poimandres.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
				disable_background = true,
			})
		end,

		-- optionally set the colorscheme within lazy config
		--init = function()
		--vim.cmd("colorscheme poimandres")
		--end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
				},
			})

			-- vim.cmd("colorscheme github_dark_default")
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		config = function()
			require("vscode").setup({
				transparent = true,
				group_overrides = {
					Comment = { fg = "#808080", bg = "NONE" },
				},
			})

			-- vim.cmd("colorscheme vscode")
		end,
	},
}
