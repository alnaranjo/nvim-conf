return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local tree = require('nvim-tree')
        tree.setup({
            filters = {
                dotfiles = false,
            },
        })
    end
}
