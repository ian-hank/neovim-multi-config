local aug = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- Highlight on yank
au('TextYankPost', { group = aug('YankHighlight', {}), callback = function() vim.highlight.on_yank() end })
