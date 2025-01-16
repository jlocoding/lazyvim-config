-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = true -- show relative line numbers
opt.nu = true -- shows absolute line number on cursor line (when relative number is on)

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.ignorecase = true
opt.hlsearch = true -- do not highlight search
opt.incsearch = true -- incremental search
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "no"
opt.scrolloff = 8
opt.updatetime = 50
opt.colorcolumn = "120"

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- spellcheck
opt.spell = true
opt.spelllang = "en_gb,cjk"
opt.spelloptions = "camel"

-- disable yank to system clipboard
opt.clipboard = ""

-- Animation from snacks
vim.g.snacks_animate = false
