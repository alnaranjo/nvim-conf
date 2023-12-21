local opts = { noremap = true, silent = true }
local terminal_opts = { silent = true }

-- leader key
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>sh', ':split<CR>', opts)
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', opts)

vim.keymap.set('n', '<leader>L', ':Lazy<CR>', opts)
vim.keymap.set('n', '<leader>M', ':Mason<CR>', opts)

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', opts)
vim.keymap.set('n', '<leader>fh', ':Telescope.help_tags<CR>', opts)

-- diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- window resize
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- buffer navigation
vim.keymap.set('n', '<S-l>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', opts)

-- indentation
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- text manipulation
vim.keymap.set('v', 'p', '"_dP', opts)

vim.keymap.set('v', '<A-j>', ':move .+1<CR>==', opts)
vim.keymap.set('v', '<A-k>', ':move .-2<CR>==', opts)

vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv", opts)
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv", opts)
vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

-- terminal navigation
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h', terminal_opts)
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j', terminal_opts)
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k', terminal_opts)
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l', terminal_opts)

