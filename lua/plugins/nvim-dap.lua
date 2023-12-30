return {
	{
		"mfussenegger/nvim-dap",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"folke/neodev.nvim",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})
			local dapui = require("dapui")
			dapui.setup()

			local dap = require("dap")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			local dap_utils_response, dap_utils = pcall(require, "dap.utils")

			if not dap_utils_response then
				return
			end

            dap.adapters['pwa-node'] = {
                type = "server",
                host = "127.0.0.1",
                port = 8123,
                executable = {
                    command = "js-debug-adapter"
                }
            }

			for _, language in ipairs({
				"typescript",
				"javascript",
				"javascriptreact",
				"typescriptreact",
			}) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Lauch Current File (pwa-node)",
						cwd = vim.fn.getcwd(),
						args = { "${file}" },
						sourceMaps = true,
						protocol = "inspector",
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Lauch Current File (pwa-node with ts-node)",
						cwd = vim.fn.getcwd(),
						runtimeArgs = { "--loader", "ts-node/esm" },
						runtimeExecutable = "node",
						args = { "${file}" },
						sourceMaps = true,
						skipFiles = { "<node_internals>/**", "node_modules/**" },
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
					},
					{
						type = "pwa-node",
						requrest = "launch",
						name = "Launch Test Current File (pwa-node with jest)",
						cwd = vim.fn.getcwd(),
						runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
						runtimeExecutable = "node",
						args = { "${file}", "--coverage", "false" },
						rootPath = "${workspaceFolder}",
						sourceMaps = true,
						console = "integratedTerminal",
						internalConsoleOptions = "neverOpen",
						skipFiles = { "<node_internals>/**", "node_modules/**" },
					},
					{
						type = "pwa-chrome",
						request = "attach",
						name = "Attach Program (pwa-chrome, select port)",
						program = "${file}",
						cwd = vim.fn.getcwd(),
						sourceMaps = true,
						port = function()
							return vim.fn.input({
								prompt = "Select port: ",
								default = 9222,
							})
						end,
						webRoot = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach Program (pwa-node, select pid)",
						cwd = vim.fn.getcwd(),
						processId = dap_utils.pick_process,
						skipFiles = { "<node_internals>/**" },
					},
				}
			end
		end,
	},
}
