return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "wave",              -- "wave" | "dragon" | "lotus"
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
      overrides = function(_)
        return {}
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },

  { "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { options = { theme = "auto" } } },

  { "lewis6991/gitsigns.nvim", opts = {} },
  { "folke/which-key.nvim",    opts = {} },
}

