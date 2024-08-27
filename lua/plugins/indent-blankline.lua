return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    main = "ibl",
    config = function()
        local blankline = require('ibl')

        blankline.setup({
            indent = {
                char = "┊",
            },
            whitespace = {
                remove_blankline_trail = true,
            },
        })
    end,
}
