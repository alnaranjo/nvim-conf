return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- null_ls.builtins.diagnostics.luacheck, --lua
				null_ls.builtins.diagnostics.cfn_lint, -- cloudformation
				null_ls.builtins.formatting.clang_format, -- c/c++
				null_ls.builtins.formatting.prettier, -- js/ts
			},
		})
	end,
}
