return {
  {
    "echasnovski/mini.surround",
    version = false,          
    event = "VeryLazy",       
    opts = {
      mappings = {
        add = "sa",            -- Add surrounding
        delete = "sd",         -- Delete surrounding
        replace = "sr",        -- Replace surrounding
        find = "sf",           -- Find right surrounding
        find_left = "sF",      -- Find left surrounding
        highlight = "sh",      -- Highlight surrounding
        update_n_lines = "sn", -- Update search range
        suffix_last = "l",     -- Suffix to target last
        suffix_next = "n",     -- Suffix to target next
      },
    },
    config = function(_, opts)
      require("mini.surround").setup(opts)
    end,
  },
}
