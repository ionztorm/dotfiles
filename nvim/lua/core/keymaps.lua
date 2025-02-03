-- Define common keymap options
local common_opts = { noremap = true, silent = true }

-- Utility function for setting key mappings
local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	for k, v in pairs(common_opts) do
		if opts[k] == nil then
			opts[k] = v
		end
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- navigation edits
-- Remap j and k to gj and gk in normal and visual mode
map("n", "j", "gj", { desc = "Move down visually" })
map("n", "k", "gk", { desc = "Move up visually" })
map("v", "j", "gj", { desc = "Move down visually" })
map("v", "k", "gk", { desc = "Move up visually" })

-- Remap Up and Down to gk and gj
map("n", "<Up>", "gk", { desc = "Move up visually" })
map("n", "<Down>", "gj", { desc = "Move down visually" })
map("v", "<Up>", "gk", { desc = "Move up visually" })
map("v", "<Down>", "gj", { desc = "Move down visually" })

-- Move lines up and down
map("n", "<S-Up>", ":m .-2<CR>==", { desc = "Move line up" })
map("n", "<S-Down>", ":m .+1<CR>==", { desc = "Move line down" })
map("x", "<S-Up>", ":move '<-2<CR>gv-gv", { desc = "Move selected lines up" })
map("x", "<S-Down>", ":move '>+1<CR>gv-gv", { desc = "Move selected lines down" })

-- buffers
map("n", "<leader>bn", ":bnext<CR>", { desc = "Switch to the next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Switch to the previous buffer" })
map("n", "<leader>bx", ":bdelete<CR>", { desc = "Close the current buffer" })
map("n", "<leader>bd", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except the current one" })

-- Navigate panes
map("n", "<C-h>", "<C-w>h", { desc = "Move to the pane on the left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to the pane below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to the pane above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to the pane on the right" })

-- LivePreviewToggle

map("n", "<leader>ls", function()
	sennvim.utilities.toggle_live_preview()
end, { desc = "Toggle LivePreview" })

-- lazygit
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })

-- neotree / mini.files
map("n", "<leader>ee", ":lua MiniFiles.open()<CR>", { desc = "Togglu MiniFiles" })

map("n", "<leader>ff", require("fzf-lua").files, { desc = "Fzf Files" })
map("n", "<leader>fr", require("fzf-lua").registers, { desc = "Fzf Registers" })
map("n", "<leader>fm", require("fzf-lua").marks, { desc = "Fzf Marks" })
map("n", "<leader>fg", require("fzf-lua").live_grep, { desc = "Fzf Grep" })
map("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Fzf Buffers" })
map("n", "<leader>fh", require("fzf-lua").help_tags, { desc = "Fzf Help" })
map("n", "<leader>fc", require("fzf-lua").git_bcommits, { desc = "Fzf Git Commits" })

-- lsp

local M = {}

M.lsp = function(bufnr)
	map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = bufnr })
	map("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Hover info", buffer = bufnr })
	map("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = bufnr })
	map("n", "<leader>cr", vim.lsp.buf.references, { desc = "Show references", buffer = bufnr })
	map("n", "<leader>cn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = bufnr })
	map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = bufnr })
	map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format code", buffer = bufnr })
	map("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Open diagnostic", buffer = bufnr })
end
return M
