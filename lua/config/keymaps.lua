local terminal_opts = { silent = true }
local opts          = { noremap = true, silent = true }

function generate_opts(desc)
    desc = desc or ""
    return { desc = desc, noremap = true, silent = true }
end

-- leader key
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", generate_opts("explorer"))
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", generate_opts("split horizontal"))
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", generate_opts("split vertical"))

vim.keymap.set('n', '<leader>D', vim.diagnostic.open_float, generate_opts("open diagnostics"))
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", generate_opts("open lazy"))
vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>", generate_opts("open mason"))
vim.keymap.set("n", "<leader>G", "<cmd>vertical G<cr>", generate_opts("open git"))
vim.keymap.set("n", "<leader>z", "<cmd>tab split<cr>", generate_opts("zoom"))

-- cut, copy, paste
vim.keymap.set("n", "<leader>y", '"+y', generate_opts("yank"))
vim.keymap.set("v", "<leader>y", '"+y', generate_opts("yank"))
vim.keymap.set("x", "<leader>p", '"_dP', generate_opts("paste"))
vim.keymap.set("n", "<leader>d", '"_d', generate_opts(""))
vim.keymap.set("v", "<leader>d", '"_d', generate_opts())

-- diagnostics navigation
vim.keymap.set("n", "<leader>j", vim.diagnostic.goto_next, generate_opts())
vim.keymap.set("n", "<leader>k", vim.diagnostic.goto_prev, generate_opts())
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, generate_opts())
--
-- text manipulation
vim.keymap.set("n", "J", "mzJ`z", opts)
vim.keymap.set("v", "J", "<cmd>move '>+1<cr>gv-gv", opts)
vim.keymap.set("v", "K", "<cmd>move '<-2<cr>gv-gv", opts)

-- window resize
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- buffer navigation
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", opts)
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", opts)

-- indentation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", terminal_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", terminal_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", terminal_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", terminal_opts)
