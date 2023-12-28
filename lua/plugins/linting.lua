return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			lua = { "luacheck" },
			javascript = { "eslint" },
			typescrupt = { "eslint" },
			javascriptreact = { "eslint" },
			typescriptreact = { "eslint" },
			svelete = { "eslint" },
			bash = { "shellcheck" },
			c = { "clang" },
		}

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end)
	end,
}
