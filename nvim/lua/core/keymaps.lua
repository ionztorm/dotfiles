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

local M = {}

-- Set key mappings using the utility function
map("n", "<leader>q", ":q<CR>", { desc = "Close the current window" })
map("n", "<leader>w", ":w<CR>", { desc = "Save" })

-- Move lines up and down
map("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
map("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
map("x", "<A-Up>", ":move '<-2<CR>gv-gv", { desc = "Move selected lines up" })
map("x", "<A-Down>", ":move '>+1<CR>gv-gv", { desc = "Move selected lines down" })

-- buffers
map("n", "<leader>bn", ":bnext<CR>", { desc = "Switch to the next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Switch to the previous buffer" })
map("n", "<leader>bx", ":bdelete<CR>", { desc = "Close the current buffer" })
map("n", "<leader>bd", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except the current one" })

-- #############################################
-- Plugins
-- #############################################

-- lazygit
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })

-- neotree
map("n", "<leader>ee", ":Neotree toggle<CR>", { desc = "Togglu Neotree" })

--Telescope Maps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- lsp

M.lsp = function(bufnr)
	map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = bufnr })
	map("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Hover info", buffer = bufnr })
	map("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = bufnr })
	map("n", "<leader>cr", vim.lsp.buf.references, { desc = "Show references", buffer = bufnr })
	map("n", "<leader>cn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = bufnr })
	map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = bufnr })
	map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format code", buffer = bufnr })
	map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic", buffer = bufnr })
end

return M
