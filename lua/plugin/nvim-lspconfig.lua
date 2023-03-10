------------------------------------------------------------
-- Neovim LSP configuration file
------------------------------------------------------------

-- Plugin: nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig

-- Add additional capablilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    },
}

-- Use on_attach function to only map the following keys after the language
-- server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Language servers
-- For server list see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local default_config = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    }
}

local lspconfig = require('lspconfig')

-- Configure mason for managing language server installations
require('mason').setup()
require('mason-lspconfig').setup {
    ensure_installed = {'rust-analyzer', 'clangd'}
}

require('lspconfig').clangd.setup {
    -- on_attach = keybinds.on_attach,
    cmd = {
        "clangd",
        "--background-index",
        "--suggest-missing-includes",
        -- "--compile-commands-dir=/home/localuser/test/build",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
}

-- set default configuration
lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util.default_config, default_config)

-- note: rust-analyzer handled by the rust-tools plugin
local servers = {
    clangd = {},
}

for server, config in pairs(servers) do
    lspconfig[server].setup(vim.tbl_deep_extend('force', default_config, config))
end
