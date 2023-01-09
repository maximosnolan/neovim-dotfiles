--------------------------------------------------------------------------------
-- Keybinds configuration file
--------------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

--------------------------------------------------------------------------------
-- Neovim
--------------------------------------------------------------------------------

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', default_opts)

-- disable arrows
map('', '<up>', '<nop>', { noremap = true })
map('', '<down>', '<nop>', { noremap = true })
map('', '<left>', '<nop>', { noremap = true })
map('', '<right>', '<nop>', { noremap = true })

-- split navigation
map('n', '<C-h>', '<C-W>h', default_opts)
map('n', '<C-j>', '<C-W>j', default_opts)
map('n', '<C-k>', '<C-W>k', default_opts)
map('n', '<C-l>', '<C-W>l', default_opts)

-- close all windows and exit from neovim
map('n', '<leader>q', ':qa!<CR>', default_opts)

-- correct control space behaviour
map('n', '<C-@>', '<C-Space>', default_opts)
map('i', '<C-@>', '<C-Space>', default_opts)
-- map('n', '<C-Space>', '<C-x><C-o>', default_opts)

--------------------------------------------------------------------------------
-- Plugin shortcuts
--------------------------------------------------------------------------------

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)          -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)     -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts)    -- search file

-- telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', default_opts)   -- file search
map('n', '<leader>fg', ':Telescope live_grep<CR>', default_opts)    -- symbol search
map('n', '<leader>fb', ':Telescope buffers<CR>', default_opts)      -- open buffer list
map('n', '<leader>fh', ':Telescope help_tags<CR>', default_opts)    -- help menu
map('n', '<leader>fs', ':Telescope sessions<CR>', default_opts)     -- sessions menu
map('n', '<leader>ft', ":TodoTelescope<CR>", default_opts)          -- TODOs

-- trouble
map('n', '<F3>', ':TroubleToggle<CR>', default_opts)

-- diffview
map('n', '<leader>dv', ':DiffviewOpen<CR>', default_opts)

-- vista
map('n', '<F4>', ':Vista!!<CR>', default_opts)
