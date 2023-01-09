--------------------------------------------------------------------------------
-- Neovim Settings
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- API Aliases
--------------------------------------------------------------------------------
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt

--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------
g.mapleader = ','
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false

--------------------------------------------------------------------------------
-- UI
--------------------------------------------------------------------------------
opt.number = true
opt.showmatch = true
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = false

-- highlight current line
cmd [[set cursorline]]

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

--------------------------------------------------------------------------------
-- Colorscheme
--------------------------------------------------------------------------------
g.nord_cursor_line_number_background = true
g.nord_contrast = true
g.nord_italic = false
cmd [[colorscheme nord]]
opt.termguicolors = true

--------------------------------------------------------------------------------
-- Tabs / Indents
--------------------------------------------------------------------------------
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- don't auto-comment new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
