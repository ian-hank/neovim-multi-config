local o = vim.opt

-- colors & UI
o.termguicolors = true
o.number = true
o.relativenumber = true
o.cursorline = true
o.wrap = false
o.scrolloff = 8
o.laststatus = 3        -- global statusline
o.cmdheight = 0         -- modern cmdline UI 

-- tabs/indent
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true

-- search
o.ignorecase = true
o.smartcase = true

-- undo files
local undodir = vim.fn.stdpath('state') .. '/undodir'
o.undofile = true
o.undodir = undodir
vim.fn.mkdir(undodir, 'p')

-- grep integration
if vim.fn.executable('rg') == 1 then
  o.grepprg = 'rg --vimgrep'
  o.grepformat = '%f:%l:%c:%m'
end
