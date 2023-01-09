-- File: ~/.config/nvim/lua/syntax.lua
-- Author: Jason Deal
-- Custom syntax configuration

vim.cmd [[
    set runtimepath+=~/.config/nvim/syntax
]]

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"} , {
    pattern = "*.ad",
    command = "setfiletype adder",
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"} , {
    pattern = "*.boa",
    command = "setfiletype boa",
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"} , {
    pattern = "*.cobra",
    command = "setfiletype cobra",
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"} , {
    pattern = "*.diamond",
    command = "setfiletype diamondback",
})
