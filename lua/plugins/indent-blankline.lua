return {
    'lukas-reineke/indent-blankline.nvim',
    lazy = false,
    main = 'ibl',
    config = function()
        require('ibl').setup({
            indent = {
                char = '┊'
            },
            whitespace = {
                remove_blankline_trail = true
            }
        })
    end
}
