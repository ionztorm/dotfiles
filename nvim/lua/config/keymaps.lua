-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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
