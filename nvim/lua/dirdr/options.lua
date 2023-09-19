-- system clipboard
vim.opt.clipboard = "unnamedplus"
-- cmp settings
vim.opt.completeopt = { "menuone", "noselect" }

-- so that `` is visible in markdown files
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.termguicolors = true
-- to make fox-fox a word
vim.opt.iskeyword:append("-")
vim.opt.undofile = true
vim.updatetime = 100
vim.opt.ignorecase = true
vim.opt.showtabline = 4
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.timeoutlen = 1000
vim.opt.updatetime = 300
vim.opt.shiftwidth = 4

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
