return {
    {
        'nvim-tree/nvim-tree.lua',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            filters = {
                dotfiles = true
            }
        }
    },
    {
        'nvim-tree/nvim-web-devicons'
    }
}
