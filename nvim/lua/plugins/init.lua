require('lazy').setup({
  spec = {
    { import = 'plugins.specs.ui' },
    { import = 'plugins.specs.treesitter' },
    { import = 'plugins.specs.telescope' },
  },
  install = { colorscheme = { 'tokyonight' } },
  checker = { enabled = false },
})
