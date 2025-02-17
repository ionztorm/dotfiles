-- ===========================================
-- Set some globals
-- ===========================================

-- _G.sennvim = require("utils")

-- ===========================================
-- Shortcuts for Vim API
-- ===========================================
local g = vim.g -- Shorten vim.g to g
local opt = vim.opt -- Shorten vim.opt to opt
local cmd = vim.cmd -- Shorten vim.cmd to cmd
local api = vim.api -- Shorten vim.api to api

-- ===========================================
-- For neotree - hides netrw
-- ===========================================
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- ===========================================
-- Leader Key Settings
-- ===========================================
g.mapleader = " " -- Set space as the leader key
g.maplocalleader = "\\" -- Set backslash as the local leader key

-- ===========================================
-- UI Settings
-- ===========================================

opt.termguicolors = true
opt.showcmd = true -- Show command in the bottom bar
opt.number = true -- Enable line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true -- Highlight the current line
-- opt.cursorcolumn = true -- Highlight the current column
opt.colorcolumn = "100"
-- cmd([[highlight ColorColumn ctermbg=lightgrey guibg=#47215F]])
opt.fillchars = { eob = " " } -- Hide tildes on empty lines
opt.splitright = true -- Vertical splits open to the right
opt.splitbelow = true -- Horizontal splits open below
opt.splitkeep = "cursor" -- Keep cursor centered during splits
opt.hlsearch = true -- Highlight search matches
opt.signcolumn = "yes" -- Show sign column
opt.cmdheight = 0 -- hides the command line when not in use
opt.shortmess:append("W")

-- ===========================================
-- Indentation Settings
-- ===========================================
opt.expandtab = true -- Convert tabs to spaces
-- opt.smarttab = true -- Smart tab behavior
opt.shiftwidth = 4 -- Indent by 4 spaces
opt.tabstop = 4 -- Tab width is 4 spaces
opt.autoindent = true -- Auto-indent new lines
opt.smartindent = true -- Smart indent based on code structure
opt.breakindent = true -- Preserve indent in wrapped lines
opt.list = true -- Show whitespace characters
opt.listchars:append("tab:· ")
opt.listchars:append("space:·") -- Use a centered dot for spaces

-- ===========================================
-- Scrolling and Cursor Settings
-- ===========================================
opt.scrolloff = 5 -- Keep 10 lines visible when scrolling
opt.sidescrolloff = 5 -- Keep 5 columns visible when scrolling horizontally

-- ===========================================
-- Behavior Settings
-- ===========================================
opt.backspace = { "start", "eol", "indent" } -- Backspace behavior
opt.formatoptions:append({ "r" }) -- Continue comments with new line

-- ===========================================
-- Performance Settings
-- ===========================================
opt.updatetime = 300 -- Faster completion time (default 4000ms)

-- ===========================================
-- Syntax and Highlighting
-- ===========================================
cmd.syntax = "enable" -- Enable syntax highlighting

-- ===========================================
-- Matching Settings
-- ===========================================
opt.showmatch = true -- Highlight matching parentheses
