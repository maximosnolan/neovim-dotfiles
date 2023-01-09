------------------------------------------------------------
-- Golang settins
------------------------------------------------------------

local opt = vim.opt

opt.expandtab = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- enable auto format / import sorting
-- vim.api.nvim_command([[autocmd BufWritePre *.go lua vim.lsp.buf.formatting()]])
-- vim.api.nvim_command([[autocmd BufWritePre *.go lua goimports(1000)]])
