return {
    {
        "mfussenegger/nvim-dap",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "folke/neodev.nvim",

            -- Creates a beautiful debugger UI
            'rcarriga/nvim-dap-ui',

            -- Required dependency for nvim-dap-ui
            'nvim-neotest/nvim-nio',

            -- Installs the debug adapters for you
            'williamboman/mason.nvim',
            'jay-babu/mason-nvim-dap.nvim',

            -- Add your own debuggers here
            'leoluz/nvim-dap-go',
        },
        keys = function(_, keys)
            local dap = require('dap')
            local dapui = require('dapui')

            return {
                { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
                {
                    '<leader>B',
                    function()
                        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
                    end,
                    desc = 'Debug: Set Breakpoint',
                },
                { '<F1>',      dap.step_into,         desc = 'Debug: Step Into' },
                { '<F2>',      dap.step_over,         desc = 'Debug: Step Over' },
                { '<F3>',      dap.step_out,          desc = 'Debug: Step Out' },
                { '<F5>',      dap.continue,          desc = 'Debug: Start/Continue' },
                { '<F7>',      dapui.toggle,          desc = 'Debug: Toogle UI' },
                unpack(keys),
            }
        end,
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')

            require('mason-nvim-dap').setup({
                automatic_installation = true,
                handlers = {},
                ensure_installed = {},
            })

            dapui.setup({
                icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
                controls = {
                    icons = {
                        pause = '⏸',
                        play = '▶',
                        step_into = '⏎',
                        step_over = '⏭',
                        step_out = '⏮',
                        step_back = 'b',
                        run_last = '▶▶',
                        terminate = '⏹',
                        disconnect = '⏏',
                    },
                },
            })

            dap.listeners.after.event_initialized['dapui_config'] = dapui.open
            dap.listeners.before.event_terminated['dapui_config'] = dapui.close
            dap.listeners.before.event_exited['dapui_config'] = dapui.close
        end,
    },
}
