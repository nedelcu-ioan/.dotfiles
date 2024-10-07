vim.opt.number = true
vim.opt.fillchars:append("vert:|")
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Tab spacing/behavior
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.breakindent = true

-- General behavior
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 1000
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.writebackup = false
vim.opt.cursorline = true
vim.g.have_nerd_font = true
vim.opt.colorcolumn = "89"

-- Searching Behavior
vim.opt.hlsearch = true
vim.opt.ignorecase = true

vim.opt.list = true
vim.opt.listchars = { tab = "→ ", space = "·", eol = "↲" }

vim.opt.termguicolors = true
vim.cmd("colorscheme vim")
