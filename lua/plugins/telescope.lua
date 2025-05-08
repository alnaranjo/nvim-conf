return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local telescope = require('telescope')

            telescope.setup({
                defaults = {
                    find_files = {
                        hidden = false
                    },
                    file_ignore_patterns = {
                        '.next',
                        'dist',
                        'node_modules',
                        'pnpm-lock.yaml',
                    },
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                        '--hidden',
                        '--glob=!.git'
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search help' })
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Search keymaps' })
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Search files' })
            vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = 'Search select telescope' })
            vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Search current word' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Search by grep' })
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Search diagnostics' })
            vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Search resume' })
            vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = 'Search recent files ("." for repeat)' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Search existing buffers' })

            vim.keymap.set('n', '<leader>/', function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })

            vim.keymap.set('n', '<leader>f/', function()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                }
            end, { desc = 'Search in open files' })

            vim.keymap.set('n', '<leader>sn', function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end, { desc = 'Search neovim files' })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        lazy = false,
        config = function()
            require("telescope").load_extension("ui-select")
        end,
    },
}
