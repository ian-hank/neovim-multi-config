require("lazy").setup({
  spec = {
    { import = "plugins.specs.ui" },
    { import = "plugins.specs.treesitter" },
    { import = "plugins.specs.telescope" },
    { import = "plugins.specs.mini-surround" },
    { import = "plugins.specs.alpha" },
  },
  install = { colorscheme = { "kanagawa" } },
  rocks = { enabled = false },   -- silences luarocks warnings
  checker = { enabled = false },
})

