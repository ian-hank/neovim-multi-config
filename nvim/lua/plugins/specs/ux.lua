return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
        },
        opts = {
            defaults = {
                layout_strategy = "flex",
                sorting_strategy = "ascending",
                prompt_prefix = "   ",
            },
        },
    },

    -- Git signs in gutter (+ hunk actions)
    { "lewis6991/gitsigns.nvim", event = "BufReadPre", config = true },

    -- Key-hint popup
    { "folke/which-key.nvim", event = "VeryLazy", config = true },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("lualine").setup({
                options = { icons_enabled = true, globalstatus = true },
            })
        end,
    },

    -- Diagnostics list (LSP/treesitter/linters) in a quick panel
    { "folke/trouble.nvim", cmd = { "Trouble", "TroubleToggle" }, opts = {} },

    -- Indentation guides
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- Slick buffer-as-explorer (alternative to netrw)
    { "stevearc/oil.nvim", opts = {} },
}
