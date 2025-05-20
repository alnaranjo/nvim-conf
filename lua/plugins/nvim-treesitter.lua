return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "javascript",
                    "typescript",
                    "tsx",
                    "json",
                    "yaml",
                    "bash",
                    "make",
                    "gitignore",
                    "dockerfile",
                    "markdown",
                    "html",
                    "css",
                },
                auto_install = true,
                ignore_install = {},
                sync_install = false,
                modules = {},
                highlight = {
                    enable = true,
                },
                indent = { enable = true },
                autotag = { enable = true },
            })
        end,
    },
    {
        "nvim-treesitter/playground",
        lazy = false,
    },
}
