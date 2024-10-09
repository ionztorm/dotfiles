return {
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
				comments = { italic = false },
				keywords = { italic = false },
				variables = { bold = true },
			},
			dim_inactive = true,
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
-- return {
-- 	"sho-87/kanagawa-paper.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("kanagawa-paper").setup({
-- 			undercurl = true,
-- 			transparent = true,
-- 			gutter = false,
-- 			dimInactive = true,
-- 			termenalColors = true,
-- 			commentStyle = { italic = false },
-- 			functionStyle = { italic = false },
-- 			keywordStyle = { italic = false, bold = false },
-- 			statementStyle = { italic = false, bold = false },
-- 			typeStyle = { italic = false },
-- 			variableStyle = { bold = true },
-- 		})
-- 		vim.cmd.colorscheme("kanagawa-paper")
-- 	end,
-- }

-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			undercurl = true,
-- 			commentStyle = { italic = false },
-- 			functionStyle = { italic = false },
-- 			keywordStyle = { italic = false },
-- 			statementStyle = { bold = true },
-- 			typeStyle = {},
-- 			transparent = true,
-- 			dimInactive = true,
-- 			terminalColors = true,
-- 		})
-- 		vim.cmd.colorscheme("kanagawa-wave")
-- 	end,
-- }

-- return {
-- 	"Shatur/neovim-ayu",
-- 	config = function()
-- 		require("ayu").setup({
-- 			overrides = {
-- 				Normal = { bg = "None" },
-- 				-- ColorColumn = { bg = "None" },
-- 				SignColumn = { bg = "None" },
-- 				Folded = { bg = "None" },
-- 				FoldColumn = { bg = "None" },
-- 				-- CursorLine = { bg = "None" },
-- 				CursorColumn = { bg = "None" },
-- 				WhichKeyFloat = { bg = "None" },
-- 				VertSplit = { bg = "None" },
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("ayu-mirage")
-- 	end,
-- }

-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			dim_inactive_windows = true,
-- 			extended_background_behind_borders_background_behind_borders = false,
-- 			styles = {
-- 				italic = false,
-- 				transparency = true,
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("rose-pine")
-- 	end,
-- }
