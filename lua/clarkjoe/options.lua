-- Tabs
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Indent
vim.opt.smartindent = true

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Color
vim.opt.termguicolors = true

-- Scroll
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Time
vim.opt.updatetime = 50

-- Split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- Cursor
vim.opt.cursorline = true

-- Column
vim.opt.colorcolumn = "80"

-- Fold
vim.opt.foldmethod = "expr"
