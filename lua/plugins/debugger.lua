return {
	-- this is the general dap adaptor, works for every language (need config for each)
	-- for specific language, check:
	-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
	"mfussenegger/nvim-dap",


	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap-python",
	},

	config = function()
		-- configure ui
		local dap, dapui = require("dap"), require("dapui")

		-- setup
		require("dapui").setup()
        require("dap-python").setup("python3")

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
		vim.keymap.set("n", "<F5>", function()
			require("dap").continue()
		end, { desc = "Continue debugger" })

		vim.keymap.set("n", "<F6>", function()
			require("dap").step_out()
		end, { desc = "Step out" })

		vim.keymap.set("n", "<F7>", function()
			require("dap").step_into()
		end, { desc = "Step into" })

		vim.keymap.set("n", "<F8>", function()
			require("dap").step_over()
		end, { desc = "Step over" })

		vim.keymap.set("n", "<leader>dt", function()
			require("dap").toggle_breakpoint()
		end, { desc = "Toggle breakpoint" })

		vim.keymap.set("n", "<leader>dB", function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Set breakpoint condition" })

        vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
            require("dap.ui.widgets").hover();
            -- Create a buffer-local mapping for "q" to close the hover window
            vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd> close <CR>", { noremap = true, silent = true })
        end, {desc = "Hover in debugger"})

		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end, { desc = "Preview (debugger)" })

		vim.keymap.set({ "n", "v" }, "<Leader>de", function()
			require("dapui").eval(vim.fn.input("Expression: "))
		end, { desc = "Evaluate expresion (debugger)" })

		vim.keymap.set({ "n", "v" }, "<leader>dw", function()
			dapui.elements.watches.add(vim.fn.input("Expresion to watch: "))
		end, { desc = "Add expression to watch" })

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
			command = vim.fn.expand("~/.local/share/nvim/mason/bin/OpenDebugAD7"),
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
				setupCommands = {
					{
						text = "-enable-pretty-printing",
						description = "enable pretty printing",
						ignoreFailures = false,
					},
				},
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
