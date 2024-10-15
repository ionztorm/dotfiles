-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "night",
-- 			transparent = true,
-- 			terminal_colors = true,
-- 			styles = {
-- 				floats = "transparent",
-- 				sidebars = "transparent",
-- 				comments = { italic = false },
-- 				keywords = { italic = false },
-- 				variables = { bold = true },
-- 			},
-- 			dim_inactive = true,
-- 		})
-- 		vim.cmd.colorscheme("tokyonight")
-- 	end,
-- }

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        cmp = true,
        neotree = true,
        -- fidget = true,
        -- gitsigns = true,
        -- harpoon = true,
        -- indent_blankline = {
        --   enabled = false,
        --   scope_color = "sapphire",
        --   colored_indent_levels = false,
        -- },
        mason = true,
        native_lsp = { enabled = true },
        -- noice = true,
        -- notify = true,
        -- symbols_outline = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
      },
    })
    vim.cmd.colorscheme('catppuccin')
  end
}
