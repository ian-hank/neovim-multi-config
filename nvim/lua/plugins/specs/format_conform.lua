return {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
        local conform = require("conform")

        conform.setup({
            notify_on_error = true,
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                sh = { "shfmt" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
            },
            -- used to quickly temporarily disable on-save formatting
            -- format_on_save = nil,
        })

        local grp = vim.api.nvim_create_augroup("ConformFormat", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = grp,
            callback = function(args)
                conform.format({
                    bufnr = args.buf,
                    lsp_fallback = true,
                    timeout_ms = 2000,
                })
            end,
        })

        -- Manual mapping <leader>f
        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({ async = false, lsp_fallback = true })
        end, { desc = "Format (Conform)" })
    end,
}
