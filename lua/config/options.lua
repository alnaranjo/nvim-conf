local opt = vim.opt

-- system
opt.clipboard = "unnamedplus"
opt.mouse = 'a'
opt.updatetime = 50
opt.timeoutlen = 300
opt.termguicolors = true
opt.modifiable = true

-- completion
opt.completeopt = 'menuone,noselect'

-- editor
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.iskeyword:append('-')
opt.cursorline = true

-- indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.showtabline = 4
opt.numberwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- file
opt.fileencoding = "utf-8"
opt.swapfile = false
opt.undofile = true
opt.backup = false
opt.writebackup = false

-- search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- splitting
opt.splitbelow = true
opt.splitright = true
