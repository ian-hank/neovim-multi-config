local o = vim.opt

o.number = true
o.relativenumber = true
o.termguicolors = true
o.cursorline = true
o.wrap = false
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true
o.ignorecase = true
o.smartcase = true
o.scrolloff = 8

o.undofile = true
o.undodir = vim.fn.stdpath('state') .. '/undodir'
vim.fn.mkdir(o.undodir:get(), 'p')

if vim.fn.executable('rg') == 1 then
  o.grepprg = 'rg --vimgrep'
  o.grepformat = '%f:%l:%c:%m'
end
