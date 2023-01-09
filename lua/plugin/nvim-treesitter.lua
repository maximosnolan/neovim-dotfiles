------------------------------------------------------------
-- Treesitter config file
------------------------------------------------------------

-- Plugin: nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

require('nvim-treesitter.configs').setup {
    ensure_installed = {'lua', 'rust', 'toml'},
    auto_install = true,
    highlight = {
        enable = true
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}
