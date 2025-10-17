-- Formatting via none-ls (maintained fork of null-ls)
--
-- Python: black
-- Lua: stylua
-- C/C++: clang-format

return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,

                -- Python
                null_ls.builtins.formatting.black,

                -- C/C++
                null_ls.builtins.formatting.clang_format,

                -- null_ls.builtins.formatting.shfmt,
                -- null_ls.builtins.diagnostics.shellcheck,
                -- null_ls.builtins.formatting.prettier,
            },

            -- on_attach = function(client, bufnr)
            --   if client.supports_method("textDocument/formatting") then
            --     local grp = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
            --     vim.api.nvim_create_autocmd("BufWritePre", {
            --       group = grp, buffer = bufnr,
            --       callback = function() vim.lsp.buf.format({ async = false }) end,
            --     })
            --   end
            -- end,
        })
    end,
}
