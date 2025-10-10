local map = vim.keymap.set
vim.g.mapleader = ' '

-- Files / search
map('n', '<leader>e', function() vim.cmd('Ex') end, { desc = 'Explorer (netrw)' })
map('n', '<leader>ff', function() pcall(require('telescope.builtin').find_files) end, { desc = 'Find files' })
map('n', '<leader>fg', function() pcall(require('telescope.builtin').live_grep) end,  { desc = 'Live grep' })
map('n', '<leader>fb', function() pcall(require('telescope.builtin').buffers) end,    { desc = 'Buffers' })
map('n', '<leader>fh', function() pcall(require('telescope.builtin').help_tags) end,  { desc = 'Help' })

-- LSP placeholders 
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition', silent = true })
map('n', 'K',  vim.lsp.buf.hover,      { desc = 'Hover', silent = true })
