-- Priority increased to ensure this gets loaded first

return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
        local kanagawa = require('kanagawa')

        kanagawa.setup({
            dimInactive = true,
            theme = 'dragon'
        })

		vim.cmd("colorscheme kanagawa-dragon")
	end,
}
