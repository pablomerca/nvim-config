
return {
    -- this is the general dap adaptor, works for every language (need config for each)
    -- for specific language, check:
    -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    "mfussenegger/nvim-dap",

    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },

    config = function()
        -- configure ui
        local dap, dapui = require("dap"), require("dapui")

        -- setup
        require("dapui").setup()

        -- confugure dapui
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- configure keymaps
        vim.keymap.set("n", "<leader>dc", function()
            require("dap").continue()
        end, { desc = "Continue debugger" })

        vim.keymap.set("n", "<leader>dt", function()
            require("dap").toggle_breakpoint()
        end, { desc = "Toggle breakpoint" })

        vim.keymap.set("n", "<F10>", function()
            require("dap").step_over()
        end, { desc = "Step over" })

        vim.keymap.set("n", "<F11>", function()
            require("dap").step_into()
        end, { desc = "Step into" })

        vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
            require("dap.ui.widgets").hover()
        end, { desc = "Hover (debugger)" })

        vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
            require("dap.ui.widgets").preview()
        end, { desc = "Preview (debugger)" })

        vim.keymap.set("n", "<Leader>df", function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.frames)
        end, { desc = "Frames (debugger)" })

        vim.keymap.set("n", "<Leader>ds", function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scopes)
        end, { desc = "Scopes (debugger)" })

        -- configure c++
        -- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)
        dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            -- TODO change this to your path
            command = "/home/pablo/.local/share/nvim/mason/bin/OpenDebugAD7",
        }
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
            },
            {
                name = "Attach to gdbserver :1234",
                type = "cppdbg",
                request = "launch",
                MIMode = "gdb",
                miDebuggerServerAddress = "localhost:1234",
                miDebuggerPath = "/usr/bin/gdb",
                cwd = "${workspaceFolder}",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
            },
        }
    end,
}
