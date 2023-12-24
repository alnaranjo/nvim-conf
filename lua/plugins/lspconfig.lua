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

            -- lua
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

            -- typescript
            lspconfig.tsserver.setup({})

            local eslint_d = require("efmls-configs.linters.eslint_d")
            local prettier_d = require("efmls-configs.formatters.prettier_d")

            lspconfig.efm.setup({
                init_options = {
                    documentFormatting = true,
                    documentRangeFormatting = true,
                    hover = true,
                    documentSymbol = true,
                    codeAction = true,
                    completion = true,
                },
                filetypes = { "lua", "typescript", "typescriptreact" },
                settings = {
                    root_dir = { '.git' },
                    languages = {
                        lua = { luacheck, stylua },
                        typescript = { eslint_d, prettier_d },
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
                "efm",   -- general purpose languge server
                "lua_ls", -- lua
                "clangd", -- c/c++
                "tsserver", -- javascript/typescript
                "jsonls" -- json
            },
            automatic_installation = true,
        },
    },
    {
        "creativenull/efmls-configs-nvim",
    },
}
