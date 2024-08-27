-- lsp config
local lsp = vim.lsp

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("Lsp", {}),
    callback = function(ev)
        -- Enable completion triggered by <C-x><C-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", lsp.buf.references, opts)
        vim.keymap.set("n", "gi", lsp.buf.implementation, opts)
        vim.keymap.set("n", "K", lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>k", lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>t", lsp.buf.type_definition, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>f", function()
            lsp.buf.format({ async = true })
        end, opts)
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = vim.api.nvim_create_augroup("Lint", { clear = true }),
    callback = function()
        vim.lsp.buf.format({})
    end,
})
