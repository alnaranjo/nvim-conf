return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
            ensure_installed = {
                -- linters
                "luacheck", --lua
                "cfn-lint", -- cloudformation

                -- formatters
                "clang-format", -- c/c++
                "prettier",     -- js/ts

                -- debuggers
                "codelldb",         -- c/c++
                "js-debug-adapter", -- js/ts
            },
        })
        require("mason-lspconfig").setup()

        local servers = {
            lua_ls = {
                Lua = {
                    -- make language server recognize vim global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    -- make language server aware of runtime files
                    workspace = {
                        checkThirdParty = false,
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            },
            clangd = {},
            ts_ls = {},
            eslint = {},
            tailwindcss = {},
            html = {},
            cssls = {},
            jsonls = {},
            yamlls = {},
            bashls = {}
        }

        require("neodev").setup()

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require("cmp_nvim_lsp").default_capabilities())

        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                    root_dir = (servers[server_name] or {}).root_dir,
                })
            end,
        })
    end,
}
