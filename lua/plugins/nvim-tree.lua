return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        filters = {
            dotfiles = false,
        },
        update_focused_file = {
            enable = true
        },
        view = {
            width = 60
        }
    }
}
