return {
    {
        'williamboman/mason.nvim',
        event = "BufReadPre",
        config = function()
            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        event = 'BufReadPre',
        dependencies = {
            'williamboman/mason.nvim',
        },
        opts = {
            ensure_installed = {
                'lua_ls'
            },
            automatic_installation = true
        }
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')

            -- Lua 
            lspconfig.lua_ls.setup({})
        end
    }
}
