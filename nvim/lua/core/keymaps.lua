-- Define common keymap options
local common_opts = { noremap = true, silent = true }

-- Utility function for setting key mappings
local function map(mode, lhs, rhs, opts)
	opts = opts or {} -- Default to an empty table if no options are provided
	for k, v in pairs(common_opts) do
		if opts[k] == nil then
			opts[k] = v
		end
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Set key mappings using the utility function
map("n", "<leader>q", ":q<CR>", { desc = "Close the current window" })
map("n", "<leader>w", ":w<CR>", { desc = "Save" })


-- -- Telescope Maps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
