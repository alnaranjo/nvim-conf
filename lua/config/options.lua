
-- system
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.termguicolors = true
vim.opt.modifiable = true

-- completion
vim.opt.completeopt = "menuone,noselect"

-- editor
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.iskeyword:append("-")
vim.opt.cursorline = true

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.showtabline = 4
vim.opt.numberwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- file
vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
