return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "c", "cpp", "lua", "python",
            "json", "yaml", "cmake", "make",
            "vim", "bash"
        },
        highlight = { enable = true },
        indent = { enable = true },
    },
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
}
