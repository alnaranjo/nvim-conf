return {
    {
        'nvim-telescope/telescope.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('telescope').setup({
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown({})
                    }
                }
            })
        end
    },
    { 'nvim-lua/plenary.nvim' },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        lazy = false,
        config = function()
            require('telescope').load_extension('ui-select')
        end
    }
}
