return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"creativenull/efmls-configs-nvim",
		},
		config = function()
			require("neoconf").setup({})

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						-- make language server recognize vim global
						diagnostics = {
							globals = { "vim" },
						},
						-- make language server aware of runtime files
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			local luacheck = require("efmls-configs.linters.luacheck")
			local stylua = require("efmls-configs.formatters.stylua")

			lspconfig.efm.setup({
				filetypes = { "lua" },
				init_options = {
					documentFormatting = true,
					documentRangeFormatting = true,
					hover = true,
					documentSymbol = true,
					codeAction = true,
					completion = true,
				},
				settings = {
					languages = {
						lua = { luacheck, stylua },
					},
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"efm", -- general purpose languge server
				"lua_ls", -- lua
				"clangd", -- c/c++
				"tsserver", -- javascript/typescript
			},
			automatic_installation = true,
		},
	},
	{
		"creativenull/efmls-configs-nvim",
	},
}
