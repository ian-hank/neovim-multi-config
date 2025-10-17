return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "clangd",
                "lua_ls",
                "pyright",
                "jsonls",
                "yamlls",
                "ruff",
            },
            automatic_installation = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Buffer-local keymaps on LSP attach
            local grp = vim.api.nvim_create_augroup("UserLspKeys", { clear = true })
            vim.api.nvim_create_autocmd("LspAttach", {
                group = grp,
                callback = function(ev)
                    local map = function(m, lhs, rhs, desc)
                        vim.keymap.set(m, lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
                    end

                    -- Navigation
                    map("n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
                    map("n", "gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
                    map("n", "gi", vim.lsp.buf.implementation, "LSP: Go to implementation")
                    map("n", "gr", vim.lsp.buf.references, "LSP: References")
                    map("n", "K", vim.lsp.buf.hover, "LSP: Hover")

                    -- Actions
                    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
                    map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")

                    -- Diagnostics
                    map("n", "[d", vim.diagnostic.goto_prev, "LSP: Prev diagnostic")
                    map("n", "]d", vim.diagnostic.goto_next, "LSP: Next diagnostic")
                    map("n", "<leader>e", vim.diagnostic.open_float, "LSP: Line diagnostics")

                    -- Formatting
                    map({ "n", "v" }, "<leader>f", function()
                        vim.lsp.buf.format({ async = false })
                    end, "LSP: Format")
                end,
            })

            -- Capabilities
            local caps = vim.lsp.protocol.make_client_capabilities()

            -- Per-server config
            -- C/C++
            vim.lsp.config("clangd", {
                capabilities = caps,
                cmd = { "clangd", "--background-index", "--header-insertion=iwyu" },
            })

            -- Lua
            vim.lsp.config("lua_ls", {
                capabilities = caps,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            })

            -- Python
            vim.lsp.config("pyright", {
                capabilities = caps,
            })

            vim.lsp.config("ruff", {
                capabilities = caps,
                on_attach = function(client, _)
                    client.server_capabilities.hoverProvider = false
                end,
            })

            -- JSON
            vim.lsp.config("jsonls", { capabilities = caps })

            -- YAML
            vim.lsp.config("yamlls", { capabilities = caps })

            -- Enable servers
            for _, srv in ipairs({
                "clangd",
                "lua_ls",
                "pyright",
                "ruff",
                "jsonls",
                "yamlls",
            }) do
                pcall(vim.lsp.enable, srv)
            end
        end,
    },
}
