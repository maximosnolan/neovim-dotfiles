-- File: ~/.config/nvim/init.lua
-- Author: Jason Deal
-- Neovim init file

--------------------------------------------------------------------------------
-- Import Lua modules
--------------------------------------------------------------------------------
require('settings')
require('keybinds')
require('syntax')
require('plugin.packer')
require('plugin.nvim-cmp')
require('plugin.nvim-lspconfig')
require('plugin.nvim-tree')
require('plugin.nvim-treesitter')
require('plugin.rust-tools')
require('telescope').load_extension('media_files')
