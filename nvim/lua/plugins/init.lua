require("lazy").setup({
    spec = {
        { import = "plugins.specs.ui" },
        { import = "plugins.specs.ux" },
        { import = "plugins.specs.treesitter" },
        { import = "plugins.specs.telescope" },
        { import = "plugins.specs.mini-surround" },
        { import = "plugins.specs.alpha" },
        { import = "plugins.specs.dap" },
        { import = "plugins.specs.lsp" },
        { import = "plugins.specs.format" },
        { import = "plugins.specs.format_conform" },
    },
    install = { colorscheme = { "kanagawa" } },
    rocks = { enabled = false }, -- silences luarocks warnings
    checker = { enabled = false },
})
