-- lsp config
local api = vim.api
local keymap = vim.keymap
local lsp = vim.lsp

api.nvim_create_autocmd("LspAttach", {
	group = api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enabla completeion triggered by <C-x><C-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		keymap.set("n", "gD", lsp.buf.declaration, opts)
		keymap.set("n", "gd", lsp.buf.definition, opts)
		keymap.set("n", "gr", lsp.buf.references, opts)
		keymap.set("n", "gi", lsp.buf.implementation, opts)
		keymap.set("n", "K", lsp.buf.hover, opts)
		keymap.set("n", "<leader>k", lsp.buf.signature_help, opts)
		keymap.set("n", "<leader>wa", lsp.buf.add_workspace_folder, opts)
		keymap.set("n", "<leader>wr", lsp.buf.remove_workspace_folder, opts)
		keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		keymap.set("n", "<leader>t", lsp.buf.type_definition, opts)
		keymap.set({ "n", "v" }, "<leader>ca", lsp.buf.code_action, opts)
		keymap.set("n", "<leader>f", function()
			lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- format on save
api.nvim_create_autocmd("BufWritePost", {
	group = api.nvim_create_augroup("LspFormattingGroup", {}),
	callback = function()
		local efm = lsp.get_active_clients({ name = "efm" })
		if vim.tbl_isempty(efm) then
			return
		end

		lsp.buf.format({ async = true })
	end,
})
