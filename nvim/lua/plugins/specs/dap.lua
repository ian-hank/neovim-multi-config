-- Debugging for C/C++ (and more) with nvim-dap, dap-ui, and mason-nvim-dap.
-- This version avoids manual mason registry lookups and works across Mason versions.

return {
    -- Core DAP client
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<F5>",
                function()
                    require("dap").continue()
                end,
                desc = "DAP Continue",
            },
            {
                "<F10>",
                function()
                    require("dap").step_over()
                end,
                desc = "DAP Step Over",
            },
            {
                "<F11>",
                function()
                    require("dap").step_into()
                end,
                desc = "DAP Step Into",
            },
            {
                "<F12>",
                function()
                    require("dap").step_out()
                end,
                desc = "DAP Step Out",
            },
            {
                "<leader>db",
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "DAP Toggle Breakpoint",
            },
            {
                "<leader>dB",
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint cond: "))
                end, -- i hate that i cant find a good way below to format this lol
                desc = "DAP Conditional Breakpoint",
            },
            {
                "<leader>dr",
                function()
                    require("dap").repl.toggle()
                end,
                desc = "DAP REPL",
            },
            {
                "<leader>dl",
                function()
                    require("dap").run_last()
                end,
                desc = "DAP Run Last",
            },
            {
                "<leader>dq",
                function()
                    require("dap").terminate()
                end,
                desc = "DAP Terminate",
            },
        },
    },

    -- Mason integration for DAP adapters
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
        opts = {
            ensure_installed = { "codelldb" },
            automatic_installation = true,
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,

                codelldb = function(config)
                    require("mason-nvim-dap").default_setup(config)
                    local dap = require("dap")
                    if not dap.configurations.cpp or #dap.configurations.cpp == 0 then
                        dap.configurations.cpp = {
                            {
                                name = "Launch (codelldb)",
                                type = "codelldb",
                                request = "launch",
                                program = function()
                                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                                end,
                                cwd = "${workspaceFolder}",
                                stopOnEntry = false,
                                args = {},
                            },
                        }
                        dap.configurations.c = dap.configurations.cpp
                    end
                end,
            },
        },
    },

    -- Debug UI
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_autoopen"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_autoclose"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_autoclose"] = function()
                dapui.close()
            end
        end,
    },

    -- Inline virtual text for variables while stepping
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = { "mfussenegger/nvim-dap" },
        opts = { commented = true },
    },
}
