local o = vim.opt

-- colors & UI
o.termguicolors = true
o.number = true
o.relativenumber = true
o.cursorline = true
o.wrap = false
o.scrolloff = 8
o.laststatus = 3        -- global statusline
o.cmdheight = 1         -- modern cmdline UI 

-- tabs/indent
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
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

-- project override
vim.opt.exrc = true    -- allow project-local configs
vim.opt.secure = true  -- disallows unsafe commands in those files
