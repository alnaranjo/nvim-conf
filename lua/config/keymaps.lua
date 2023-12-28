local opts = { noremap = true, silent = true }
local terminal_opts = { silent = true }

-- leader key
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", opts)
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", opts)

vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", opts)
vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>", opts)

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope.help_tags<cr>", opts)

-- text manipulation
vim.keymap.set("n", "J", "mzJ`z", opts)
vim.keymap.set("v", "J", "<cmd>move '>+1<cr>gv-gv", opts)
vim.keymap.set("v", "K", "<cmd>move '<-2<cr>gv-gv", opts)

vim.keymap.set("n", "<leader>y", '"+y', opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("n", "<leader>Y", '"+Y', opts)

vim.keymap.set("x", "<leader>p", '"_dP', opts)

vim.keymap.set("n", "<leader>d", '"_d', opts)
vim.keymap.set("v", "<leader>d", '"_d', opts)

-- diagnostics
-- vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>j", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>k", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

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
